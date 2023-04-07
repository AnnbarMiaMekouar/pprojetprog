import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/color.dart';

class Likevide extends StatelessWidget {
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
        title :  // Ajoutez cette ligne pour décaler le texte de 7 pixels
        Text("Mes likes"),
      ),
      backgroundColor: color_3,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/empty_likes.svg', // remplacez `your_image_name.svg` par le nom de votre image
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Vous n'avez pas encore liké de contenu. \n \n Cliquez sur le coeur pour en rajouter.",
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
