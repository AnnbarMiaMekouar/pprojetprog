import 'package:flutter/material.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/Likesvides.dart';
import 'package:pprojet/Pages/Wishlistvide.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Recherche extends StatefulWidget {
  const Recherche({Key? key, required this.query}) : super(key: key);
  final String query;


  @override
  _RechercheState createState() => _RechercheState();
}
class Jeu {
  final int Id;
  final String nom;
  final String image;
  final List<dynamic> auteur;
  final String prix;

  Jeu({required this.Id, required this.nom, required this.auteur, required this.prix, required this.image});
}

class _RechercheState extends State<Recherche> {
  late Future<List<Jeu>> _futurejeux;
  TextEditingController _searchController = TextEditingController();

  //Initialisation
  @override
  void initState() {
    super.initState();
    _futurejeux = _rechercherJeux();
  }

  Future<List<Jeu>> _rechercherJeux() async {
    List<int> gameIds = await Rechercheds(widget.query);
    return _fetchGameDetails(gameIds);
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

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: color_1,
        appBar: AppBar(
          title: const Text('Recherche'),
          backgroundColor: color_1,
          automaticallyImplyLeading: false,
          titleSpacing: 15,
          actions: [
            IconButton(
              icon: ImageIcon(heartImage.image),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Likesvides()),
                );
              },
            ),
            IconButton(
              icon: ImageIcon(starImage.image),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Whishlistvide()),
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
          controller: _searchController,
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
                  MaterialPageRoute(builder: (context) => Recherche(query: _searchController.text)),
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
              Expanded(
                child: _buildJeuxList(),
              ),
            ]
        )
      );
  }

  Future<List<int>> Rechercheds(String query) async {
    final response = await http.get(Uri.parse(
        'https://store.steampowered.com/api/storesearch?term=${query}'));

    if (response.statusCode == 200) {
      List<int> gameIds = [];
      final Map<String, dynamic> data = json.decode(response.body);
      final items = data["items"] as List<dynamic>;

      for (var item in items) {
        gameIds.add(item["appid"]);
      }

      return gameIds;
    } else {
      throw Exception("Erreur lors de la recherche des jeux");
    }
  }


  Future<List<Jeu>> _fetchGameDetails(List<int> gameIds) async {
    List<Jeu> jeux = [];

    for (int gameId in gameIds) {
      final response = await http.get(Uri.parse(
          'https://store.steampowered.com/api/appdetails?appids=$gameId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final gameData = data[gameId.toString()];

        if (gameData["success"]) {
          final details = gameData["data"];
          jeux.add(Jeu(
            Id: gameId,
            nom: details["name"],
            auteur: details["developers"] ?? ["N/A"],
            prix: details["price_overview"] != null
                ? (details["price_overview"]["final"] / 100).toString()
                : "N/A",
            image: details["header_image"],
          ));
        }
      } else {
        throw Exception("Erreur lors de la récupération des détails du jeu");
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

