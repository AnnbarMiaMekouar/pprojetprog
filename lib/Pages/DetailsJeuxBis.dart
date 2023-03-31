import 'package:flutter/material.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:flutter_svg/svg.dart';

class DetailsJeuxBis extends StatefulWidget {
  const DetailsJeuxBis({Key? key}) : super(key: key);

  @override
  _DetailsJeuxBisState createState() => _DetailsJeuxBisState();
}

class _DetailsJeuxBisState extends State<DetailsJeuxBis> {
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
  final Widget backImage = SvgPicture.asset(
    'assets/images/back.svg',
    width: 20,
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_3,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                print("Image bouton cliqué");
              },
              child: SvgPicture.asset(
                'assets/images/back.svg',
                width: 24,
                height: 24,
              ),
            ),
            SizedBox(width: 8),
            Text("Détail du jeu"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Coeur cliqué");
            },
            icon: heartImage,
          ),
          IconButton(
            onPressed: () {
              print("Etoile cliquée");
            },
            icon: starImage,
          ),
        ],
      ),
      body: Center(
        child: Text("Contenu de la page Détail du jeu"),
      ),
    );
  }
}