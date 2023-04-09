import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DetailsJeuxBis extends StatefulWidget {
  const DetailsJeuxBis({Key? key, required this.appid}) : super(key: key);

  final int appid;

  @override
  _DetailsJeuxBisState createState() => _DetailsJeuxBisState();
}
class Jeu {
  final int Id;
  final String nom;
  final String image;
  final List<dynamic> auteur;


  Jeu({required this.Id, required this.nom, required this.auteur,required this.image});
}
class _DetailsJeuxBisState extends State<DetailsJeuxBis> {
  late Future<Jeu> _futurejeux;

//Initialisation
  @override
  void initState() {
    super.initState();
    _futurejeux = _telechargerJeux(widget.appid);
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
                setState ((){
                  click1 =!click1;
                });
              },
              icon: (click1 == true ) ? heartImage :  heartFull
          ),
          IconButton(
              onPressed: () {
                setState ((){
                  click2 =!click2;
                });
              },
              icon: (click2 == true ) ? starImage :  starFull
          )
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
                          title: Text(jeu.nom),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(jeu.auteur.first),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 70.0,
                            height: 80.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 50.0,
                      width: 350.0,
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
                                color: color_1,
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
                                    builder: (context) =>
                                        DetailsJeux(appid: 570),
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
                                  color: color_2,
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
                        height: 90,
                        child: ListTile(
                          title: Text('JoueurX',
                              style: TextStyle(
                                  color : Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height : 4),
                              Text('Le jeu est super',
                                  style: TextStyle(
                                      color : Colors.white)),
                            ],
                          ),
                          trailing: Container(
                            width: 50.0,
                            height: 8.0,
                            child: SvgPicture.asset(
                                'assets/images/Group 10.svg'),
                          ),
                        ),
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
                        height: 90,
                        child: ListTile(
                          title: Text('JoueurX',
                              style: TextStyle(
                                  color : Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height : 4),
                              Text('Le jeu est super',
                                  style: TextStyle(
                                      color : Colors.white)),
                            ],
                          ),
                          trailing: Container(
                            width: 50.0,
                            height: 8.0,
                            child: SvgPicture.asset(
                                'assets/images/Group 10.svg'),
                          ),
                        ),
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
                        height: 90,
                        child: ListTile(
                          title: Text('JoueurX',
                              style: TextStyle(
                                  color : Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height : 4),
                              Text('Le jeu est super',
                                  style: TextStyle(
                                      color : Colors.white)),
                            ],
                          ),
                          trailing: Container(
                            width: 50.0,
                            height: 8.0,
                            child: SvgPicture.asset(
                                'assets/images/Group 10.svg'),
                          ),
                        ),
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
                        height: 90,
                        child: ListTile(
                          title: Text('JoueurX',
                              style: TextStyle(
                                  color : Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height : 4),
                              Text('Le jeu est super',
                                  style: TextStyle(
                                      color : Colors.white)),
                            ],
                          ),
                          trailing: Container(
                            width: 50.0,
                            height: 8.0,
                            child: SvgPicture.asset(
                                'assets/images/Group 10.svg'),
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
        final List<dynamic> auteur = jsonResponse['publishers'];

        final Jeu jeu = Jeu(Id: jeuId, nom: nom, auteur: auteur, image: image);
        return jeu;
      }
    } else {
      throw Exception("Error 1");
    }
    throw Exception("Error 2");
  }
}
