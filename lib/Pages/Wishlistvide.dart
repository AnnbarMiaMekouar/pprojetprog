import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/color.dart';

class Whishlistvide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_3,
        title: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accueil()),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/close.svg',
                ),
              ),
            ),
            SizedBox(width: 15), // Ajoutez cette ligne pour décaler le texte de 7 pixels
            Text("Ma liste de souhaits"),
          ],
        ),
      ),
      backgroundColor: color_3,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/empty_whishlist.svg', // remplacez `your_image_name.svg` par le nom de votre image
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