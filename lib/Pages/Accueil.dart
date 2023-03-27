import 'package:flutter/material.dart';
import 'package:pprojet/Pages/WhishList.dart';
import 'package:pprojet/Pages/color.dart';


class Accueil extends StatelessWidget {
  final Image heartImage = Image.asset(
    'assets/images/like.png',
    width: 32,
    height: 32,
  );
  final Image starImage = Image.asset('assets/images/star.png',
  width : 32,
  height: 32,
  );
  final Image loupeImage = Image.asset('assets/images/search.png',
    width : 32,
    height: 32,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_1,
      appBar: AppBar(
        title: Text('Acceuil'),
        backgroundColor: color_1,
          automaticallyImplyLeading: false,
          titleSpacing: 15,
          actions: [
            IconButton(
                icon: heartImage.image != null ? ImageIcon(heartImage.image) : SizedBox(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WhishList()),
                  );
                }
            ),
            IconButton(
              icon : starImage.image != null ? ImageIcon(starImage.image): SizedBox(),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WhishList()),
                  );
                }
            )
        ]
      ),
        body : Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide (
                        color : Colors.blueGrey.shade900,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey.shade900,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: const OutlineInputBorder(),
                    hintText: 'Rechercher un jeu...',
                    hintStyle: const TextStyle(color:Colors.white),
                  ),
                ),
              ),
            ]
        )
    );
  }
}