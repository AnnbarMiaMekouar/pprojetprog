import 'package:flutter/material.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/WhishList.dart';
import 'package:pprojet/Pages/accueil.dart';
import 'package:pprojet/Pages/color.dart';


class Recherche extends StatefulWidget {
  const Recherche({Key? key}) : super(key: key);

  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  final Image heartImage = Image.asset(
    'assets/images/like.png',
    width: 32,
    height: 32,
  );
  final Image starImage = Image.asset('assets/images/star.png',
    width: 32,
    height: 32,
  );
  final Image backImage = Image.asset(
    'assets/images/icons8-close.png',
    width: 20,
    height: 20,
  );

  Widget buildListTile(int index) {
    // Rajouter l'api

    return Card(
      child: Container(
        color: color_3,
        child: ListTile(
          leading: Image.asset('', width: 50),
          title: Text('Titre du jeu'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Description courte'),
              Text('Prix'),
            ],
          ),
          trailing: SizedBox(
            width: 90.0,
            height: 100.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: color_2,
                elevation: 0,
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
                  MaterialPageRoute(builder: (context) => DetailsJeux()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color_1,
        appBar: AppBar(
          leading: IconButton(
            icon: ImageIcon(backImage.image),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Accueil()),
              );
            },
          ),
          title: const Text('Recherche'),
          backgroundColor: color_1,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
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
                  MaterialPageRoute(builder: (context) => WhishList()),
                );
              },
            ),
          ],
        ),
        body : Column(
            children: [
              Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
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
                        suffixIcon: Icon(Icons.search, color: color_2),
                      )
                  )
              )
            ]
        )
    );
  }
}