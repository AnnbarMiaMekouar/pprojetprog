import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/color.dart';

class Whishlistvides extends StatelessWidget {
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
            title :
            Text("Ma liste de souhaits"),
      ),
      backgroundColor: color_3,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/empty_whishlist.svg',
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Vous n'avez pas encore liké de contenu. \n \n Cliquez sur l'étoile pour en rajouter.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
