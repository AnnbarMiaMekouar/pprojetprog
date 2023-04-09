import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/DetailsJeuxBis.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class DetailsJeux extends StatefulWidget {
  const DetailsJeux({Key? key, required this.appid}) : super(key: key);

  final int appid;

  @override
  _DetailsJeuxState createState() => _DetailsJeuxState();
}

class Jeu {
  final int Id;
  final String nom;
  final String image;
  final String description;
  final List<dynamic> auteur;

  Jeu({required this.Id, required this.nom, required this.auteur, required this.image, required this.description});
}

class _DetailsJeuxState extends State<DetailsJeux> {
  late Future<Jeu> _futurejeux;

  final DatabaseReference _likesRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://progmobile-745dc-default-rtdb.europe-west1.firebasedatabase.app',
  ).ref().child('likes');

  final DatabaseReference _starsRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://progmobile-745dc-default-rtdb.europe-west1.firebasedatabase.app',
  ).ref().child('stars');


  //Initialisation
  @override
  void initState() {
    super.initState();
    _futurejeux = _telechargerJeux(widget.appid);
    _getInitialLikeState(widget.appid).then((_) {
    });
    _getInitialStarState(widget.appid).then((_) {
    });
  }


  Future<Jeu> _telechargerJeux(int jeuIds) async {
    final jeux = await GetJeux(jeuIds);
    return jeux;
  }

  final Widget heartImage = SvgPicture.asset(
    'assets/images/like.svg',
    width: 20,
    height: 20,
  );
  final Widget starImage = SvgPicture.asset(
    'assets/images/whishlist.svg',
    width: 20,
    height: 20,
  );
  final Widget heartFull = SvgPicture.asset(
    'assets/images/like_full.svg',
    width: 20,
    height: 20,
  );
  final Widget starFull = SvgPicture.asset(
    'assets/images/whishlist_full.svg',
    width: 20,
    height: 20,
  );

  bool click1 = true;
  bool click2 = true;

  void _likeGame(int gameId) {
    print('Like game called with gameId: $gameId'); // Ajoutez cette ligne
    _likesRef.child(gameId.toString()).set({'liked': true}).then((_) {
      print('Like enregistré avec succès');
    }).catchError((error) {
      print("Erreur lors de l'enregistrement du like : $error");
    });
  }

  void _unlikeGame(int gameId) {
    print('Unlike game called with gameId: $gameId'); // Ajoutez cette ligne
    _likesRef.child(gameId.toString()).remove().then((_) {
      print('Like supprimé avec succès');
    }).catchError((error) {
      print("Erreur lors de la suppression du like : $error");
    });
  }

  void _starGame(int gameId) {
    print('Star game called with gameId: $gameId'); // Ajoutez cette ligne
    _starsRef.child(gameId.toString()).set({'starred': true}).then((_) {
      print('Étoile enregistrée avec succès');
    }).catchError((error) {
      print("Erreur lors de l'enregistrement de l'étoile : $error");
    });
  }

  void _unstarGame(int gameId) {
    print('Unstar game called with gameId: $gameId'); // Ajoutez cette ligne
    _starsRef.child(gameId.toString()).remove().then((_) {
      print('Étoile supprimée avec succès');
    }).catchError((error) {
      print("Erreur lors de la suppression de l'étoile : $error");
    });
  }


  Future<void> _getInitialLikeState(int gameId) async {
    try {
      _likesRef.child(gameId.toString()).once().then((DatabaseEvent event) {
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.exists) {
          setState(() {
            click1 = false;
          });
        } else {
          setState(() {
            click1 = true;
          });
        }
      }).catchError((error) {
        print("Erreur lors de la récupération de l'état initial du like : $error");
      });
    } catch (error) {
      print("Erreur lors de la récupération de l'état initial du like : $error");
    }
  }

  Future<void> _getInitialStarState(int gameId) async {
    try {
      _starsRef.child(gameId.toString()).once().then((DatabaseEvent event) {
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.exists) {
          setState(() {
            click2 = false;
          });
        } else {
          setState(() {
            click2 = true;
          });
        }
      }).catchError((error) {
        print("Erreur lors de la récupération de l'état initial de l'étoile : $error");
      });
    } catch (error) {
      print("Erreur lors de la récupération de l'état initial de l'étoile : $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color_3,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Accueil()),
              );
            },
          ),
          title: Text("Détail du jeu"),
          titleSpacing: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  click1 = !click1;
                });
                if (click1) {
                  _unlikeGame(widget.appid);
                } else {
                  _likeGame(widget.appid);
                }
              },
              icon: (click1 == true) ? heartImage : heartFull,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  click2 = !click2;
                });
                if (click2) {
                  _unstarGame(widget.appid);
                } else {
                  _starGame(widget.appid);
                }
              },
              icon: (click2 == true) ? starImage : starFull,
            ),

          ],
        ),
        body: Container(
            color: color_3,
            child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/Bitmap-2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          _buildJeuxList(),
                        ]
                    ),
                  )
                ]
            )
        )
    );
  }


  FutureBuilder<Jeu> _buildJeuxList() {
    return FutureBuilder<Jeu>(
      future: _futurejeux,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jeu = snapshot.data!;
          return ScrollablePositionedList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 100, horizontal: 150),
                    ),
                    SizedBox(height: 0),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: color_4,
                      child: Container(
                        width: 360,
                        height: 90,
                        child: ListTile(
                          leading: Image.network(
                            jeu.image,
                            width: 100,
                            height: 100,
                          ),
                          title: Text(jeu.nom,
                              style: TextStyle(
                                  color : Colors.white) ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(jeu.auteur.first,
                                  style: TextStyle(
                                      color : Colors.white) ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 90.0,
                            height: 50.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 50.0, // définit la hauteur du container
                      width: 350.0, // définit la largeur du container
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: color_2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                                color: color_2,
                              ),
                              child: Center(
                                child: Text(
                                  'DESCRIPTION',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsJeuxBis(appid : jeu.Id),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: color_2,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                  color: color_1,
                                ),
                                child: Center(
                                  child: Text(
                                    'AVIS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: color_4,
                      child: Container(
                        width: 360,
                        height: 200,
                        child: ListTile(
                          title: Text(jeu.nom, style: TextStyle(
                              color : Colors.white) ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(jeu.description,
                                  style: TextStyle(
                                      color : Colors.white,
                                      fontSize: 14) ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
            },
          );
        }
        else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return Center(
            child: CircularProgressIndicator()
        );
      },
    );
  }

  Future<Jeu> GetJeux(int jeuId) async {
    final response = await http.get(Uri.parse(
        'https://store.steampowered.com/api/appdetails?appids=$jeuId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic>? jsonResponse = json.decode(
          response.body)[jeuId.toString()]['data'];
      if (jsonResponse != null) {
        final String nom = jsonResponse['name'];
        final String image = jsonResponse['header_image'];
        final String description = jsonResponse['short_description'];
        final List<dynamic> auteur = jsonResponse['publishers'];

        final Jeu jeu = Jeu(Id: jeuId, nom: nom, auteur: auteur, image: image, description: description);
        return jeu;
      }
    } else {
      throw Exception("Error 1");
    }
    throw Exception("Error 2");
  }
}