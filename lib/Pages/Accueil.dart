import 'package:flutter/material.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/LikesFauxWhishlist.dart';
import 'package:pprojet/Pages/Recherche.dart';
import 'package:pprojet/Pages/WhishListFauxLikes.dart';
import 'package:pprojet/Pages/color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class Jeu {
  final int Id;
  final String nom;
  final String image;
  final List<dynamic> auteur;
  final String prix;

  Jeu({required this.Id, required this.nom, required this.auteur, required this.prix,required this.image});
}

class _AccueilState extends State<Accueil> {
  TextEditingController recherche = TextEditingController();
  late Future<List<Jeu>> _futurejeux;

//Initialisation
  @override
  void initState() {
    super.initState();
    _futurejeux = _telechargerJeux();
  }

  Future<List<Jeu>> _telechargerJeux() async {
    final jeuIds = await JeuxIds();
    final jeux = await GetJeux(jeuIds);
    return jeux;
  }


  final Image heartImage = Image.asset(
    'assets/images/like.png',
    width: 32,
    height: 32,
  );
  final Image starImage = Image.asset('assets/images/star.png',
    width: 32,
    height: 32,
  );
  final Image loupeImage = Image.asset('assets/images/search.png',
    width: 32,
    height: 32,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color_1,
        appBar: AppBar(
          title: const Text('Accueil'),
          backgroundColor: color_1,
          automaticallyImplyLeading: false,
          titleSpacing: 15,
          actions: [
            IconButton(
              icon: ImageIcon(heartImage.image),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhishList()),
                );
              },
            ),
            IconButton(
              icon: ImageIcon(starImage.image),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikesFaux()),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
        Container(
        padding:
        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: recherche,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Colors.blueGrey.shade900,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey.shade900,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: const OutlineInputBorder(),
              hintText: 'Rechercher un jeu...',
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recherche(query: recherche.text)),
                  );
                },
                child: Image.asset(
                  'assets/images/Search.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
        Card(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/imageacceuil.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Titan Fall 2\n Ultimate Edition',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vous suivrez l\'histoire \n d\'un militaire qui souhaite \n devenir pilote d\'élite à la Frontière?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color_2,
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 5)
                        ),
                        child: const Text('En savoir plus'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsJeux(appid: 570)),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          //padding: EdgeInsets.all(0.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 7.0),
                // Aligner le texte à gauche
                child: Text(
                  'Les meilleures ventes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
        ),
            Expanded(
              child: _buildJeuxList(),
            ),
        ]
    )
    );
  }

  Future<List<int>> JeuxIds() async {

    final response = await http.get(Uri.parse('https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> ranks = jsonResponse['response']['ranks'];
      final List<int> ids = ranks.map((rank) => rank['appid'] as int).toList();
      return ids;
    } else {
      throw Exception('Impossible de récuperer les jeux');
    }
  }

  Future<List<Jeu>> GetJeux(List<int> jeuId) async {
    final List<Jeu> jeux = [];

    for (int Id in jeuId) {
      final response = await http.get(Uri.parse('https://store.steampowered.com/api/appdetails?appids=$Id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic>? jsonResponse = json.decode(response.body)[Id.toString()]['data'];
        if (jsonResponse != null) {
          final String nom = jsonResponse['name'];
          final String image = jsonResponse['header_image'];
          final List<dynamic> auteur = jsonResponse['publishers'];
          final Map<String, dynamic>? price = json.decode(response.body)[Id.toString()]['data']['price_overview'];

          String getPrix(Map<String, dynamic>? price) {
            if (price == null) {
              return "Gratuit";
            }
            String initialFormatted = price['initial_formatted'] as String? ?? "";
            String finalFormatted = price['final_formatted'] as String? ?? "";
            return initialFormatted != "" ? initialFormatted : finalFormatted;
          }

          String prix = getPrix(price);


          final Jeu jeu = Jeu(Id: Id, nom: nom, auteur: auteur, prix : prix, image: image);
          jeux.add(jeu);
        }
      } else {
        throw Exception("Impossible d'afficher les jeux");
      }
    }
    return jeux;
  }

  FutureBuilder<List<Jeu>> _buildJeuxList() {
    return FutureBuilder<List<Jeu>>(
      future: _futurejeux,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jeux = snapshot.data!;
          return ListView.builder(
            itemCount: jeux.length,
            itemBuilder: (context, index) {
              final jeu = jeux[index];
              SizedBox(height : 7);
              return Card(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  color: color_3,
                  child: Row(
                    children: [
                      Image.network(
                        jeu.image,
                        width: 100,
                        height: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 15),
                              Text(
                                jeu.nom,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                jeu.auteur.first,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(height: 5),
                                  SizedBox(height: 5),
                                  Text(
                                    "Prix: ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Text(
                                    jeu.prix,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.centerRight, // Alignement personnalisé
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: color_2,
                            padding: const EdgeInsets.all(2),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text(
                            'En savoir plus',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsJeux(appid: jeu.Id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
}