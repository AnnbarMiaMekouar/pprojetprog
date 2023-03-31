import 'package:flutter/material.dart';
//import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/WhishList.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsJeux extends StatefulWidget {
  const DetailsJeux({Key? key}) : super(key: key);

  @override
  _DetailsJeuxState createState() => _DetailsJeuxState();
}

class _DetailsJeuxState extends State<DetailsJeux> {
  final Widget heartImage = SvgPicture.asset(
    'assets/images/like_full.svg',
    width: 20,
    height: 20,
  );
  final Widget starImage = SvgPicture.asset(
    'assets/images/whishlist_full.svg',
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
        title: Text("Détail du jeu"),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishList()), // Remplacez OtherPage() par le nom de la page vers laquelle vous souhaitez naviguer
              );
            },
            icon: heartImage,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishList()), // Remplacez OtherPage() par le nom de la page vers laquelle vous souhaitez naviguer
              );
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
