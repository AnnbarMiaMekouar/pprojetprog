import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/DetailsJeux.dart';
import 'package:pprojet/Pages/color.dart';



class WhishList extends StatefulWidget {
  const WhishList({Key? key}) : super(key: key);

  @override
  _WhishListState createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {

  @override
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
          title :  // Ajoutez cette ligne pour décaler le texte de 7 pixels
          Text("Mes likes"),
        ),
        body : buildWishList()
    );
  }


  Widget buildWishList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            width: double.infinity,
            height: 100.0,
            color: color_3,
            child: Row(
              children: [
                Image.asset('assets/images/COD.jpg'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15),
                        Text(
                          'bonjour',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'auteur',
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
                              'prix',
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
                          builder: (context) => DetailsJeux(appid: 570),
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
}
