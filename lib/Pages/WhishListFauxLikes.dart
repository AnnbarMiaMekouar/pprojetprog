import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/Likesvides.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WhishList extends StatefulWidget {
  const WhishList({Key? key}) : super(key: key);

  @override
  _WhishListState createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {
  Map<int, Map<dynamic, dynamic>> _likedGames = {};
  bool _dataLoaded = false;


  final DatabaseReference _likesRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://progmobile-745dc-default-rtdb.europe-west1.firebasedatabase.app',
  ).ref().child('likes');

  @override
  void initState() {
    super.initState();
    _fetchGameData().then((likedGames) {
      setState(() {
        _likedGames = likedGames;
        _dataLoaded = true;
      });
    });
  }


  Future<Map<int, Map<dynamic, dynamic>>> _fetchGameData() async {
    Map<int, Map<dynamic, dynamic>> likedGames = {};

    DataSnapshot dataSnapshot = (await _likesRef.once()).snapshot;
    if (dataSnapshot.value != null) {
      Map<dynamic, dynamic> likedGamesData = dataSnapshot.value as Map<
          dynamic,
          dynamic>;
      for (var gameId in likedGamesData.keys) {
        int gameIdInt = int.tryParse(gameId) ?? -1;
        if (gameIdInt != -1) {
          likedGames[gameIdInt] = await _fetchGameDetails(gameIdInt);
        }
      }
    }

    return likedGames;
  }

  Future<Map<dynamic, dynamic>> _fetchGameDetails(int gameId) async {
    Map<dynamic, dynamic> gameData = {};

    final response = await http.get(Uri.parse('https://store.steampowered.com/api/appdetails?appids=$gameId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey(gameId.toString()) && jsonResponse[gameId.toString()]['success']) {
        Map<String, dynamic> gameDetails = jsonResponse[gameId.toString()]['data'];


        String nom = gameDetails['name'] ?? '';
        String image = gameDetails['header_image'] ?? '';
        List<dynamic> auteur = gameDetails['publishers'] ?? [];
        Map<String, dynamic>? priceData = gameDetails['price_overview'];

        String prix;
        if (priceData != null) {
          if(priceData['initial_formatted'] != "") {
            prix = priceData['initial_formatted'];
          } else {
            prix = priceData['final_formatted'];
          }
        } else {
          prix = "Gratuit";
        }

        gameData = {
          'name': nom,
          'image_url': image,
          'author': auteur.join(', '),
          'price': prix
        };

        final DatabaseReference _gameRef = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL: 'https://progmobile-745dc-default-rtdb.europe-west1.firebasedatabase.app',
        ).ref().child('games').child(gameId.toString());

        DataSnapshot dataSnapshot = (await _gameRef.once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<dynamic, dynamic> firebaseData = dataSnapshot.value as Map<dynamic, dynamic>;
          gameData.addAll(firebaseData);
        }
      }
    }

    return gameData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_1,
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
        title: Text("Mes likes"),
      ),
      body: FutureBuilder<Map<int, Map<dynamic, dynamic>>>(
        future: _fetchGameData(),
        builder: (BuildContext context, AsyncSnapshot<Map<int, Map<dynamic, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Likevide()));
            });
            return Container(); //
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                int gameId = snapshot.data!.keys.elementAt(index);
                Map<dynamic, dynamic> gameData = snapshot.data![gameId]!;
                return _buildGameCard(context, gameId.toString(), gameData);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String gameId, Map<dynamic, dynamic> gameData) {
    String nom = gameData['name'] ?? '';
    String auteur = gameData["author"] ?? "Auteur ";
    String prix = gameData["price"] ?? "Prix ";
    String image = gameData["image_url"] ?? "";

    return Card(
      child: Container(
        width: double.infinity,
        height: 100.0,
        color: color_3,
        child: Row(
          children: [
            Image.network(
              image,
              width: 120,
              height: 180,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Text(
                      nom,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                     auteur,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
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
                          prix,
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
              alignment: Alignment.centerRight,
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
                      builder: (context) =>
                          DetailsJeux(appid: int.parse(gameId)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}