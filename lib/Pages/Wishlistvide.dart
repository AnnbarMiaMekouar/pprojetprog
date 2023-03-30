import 'package:flutter/material.dart';
import 'package:pprojet/Pages/color.dart';

class Whishhlistvide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_3,
        title: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: InkWell(
                onTap:() {

                },
                child: Image.asset(
                  'assets/images/croix.png',
                ),
              ),
            ),

            Text("Ma liste de souhaits"),
          ],
        ),
      ),
      backgroundColor: color_3,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/etoiles.png', // remplacez `your_image_name.png` par le nom de votre image
              width: 200,
              height: 200,

            ),
          ),
          SizedBox(height: 20),
          Text(
            "Vous n'avez pas encore liké de contenu. Cliquez sur l'étoile pour en rajouter",
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