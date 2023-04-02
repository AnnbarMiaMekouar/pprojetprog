import 'package:flutter/material.dart';
import 'package:pprojet/Pages/DetailsJeuxBis.dart';
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
    'assets/images/like.svg',
    width: 20,
    height: 20,
  );
  final Widget starImage = SvgPicture.asset(
    'assets/images/whishlist.svg',
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
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhishList()),
              );
              },
              icon: heartImage,
            ),
            IconButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhishList()),
                );
              },
              icon: starImage,
            ),
          ],
        ),
        body: Container(
          color: color_3,
          child: Column(children: [
            Expanded(
              flex: 5,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Bitmap-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 100, horizontal: 150),
                    ),
                    SizedBox(height: 0),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: color_4,
                      child: Container(
                        width: 360,
                        height: 70,
                        child: ListTile(
                          leading: Image.asset('', width: 50),
                          title: Text(''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(''),
                              Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 50.0,
                      width: 350.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: color_2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                                color: color_2,
                              ),
                              child: Center(
                                child: Text(
                                  'DESCRIPTION',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsJeuxBis(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: color_2,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                  color: color_1,
                                ),
                                child: Center(
                                  child: Text(
                                    'AVIS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: color_4,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300), // Vous pouvez définir la hauteur maximale souhaitée ici
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  'Butterfly 2',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Battlefield 2 a pour cadre les affrontements modernes du xxie siècle. Dans le jeu original, trois armées se font face : le Corps des Marines des États-Unis, les forces armées de la fictive Coalition Moyen-Orientale et l'Armée populaire de libération (Chine). "
                                            "Il est à noter qu'étrangement, les États-Unis se retrouvent systématiquement à combattre la CMO ou la Chine, et que ces deux derniers ne s'affrontent jamais."
                                            " Selon une interview des créateurs du jeu, avoir une bataille entre les forces armées CMO et les forces armées chinoises, créerait quelques contradictions avec le scénario de Battlefield 2 qui, au passage, n'a pour l'instant jamais été connu."
                                            "L'armée de l'Union européenne fut ajoutée ultérieurement."
                                            "Battlefield 2 reprend le gameplay de Battlefield 1942 (BF1942) et Battlefield Viêt Nam (BFV), à savoir un jeu de guerre dans lequel 2 équipes s'affrontent sur un serveur."
                                            " Pour gagner, une équipe doit réduire le nombre de tickets de l'adversaire à 0, ou s'arranger pour que son équipe ait le plus grand nombre de tickets à la fin du temps imparti."
                                            "Pour ce faire, une équipe doit capturer des drapeaux et les maintenir dans son camp le plus longtemps possible. Capturer un drapeau demande du temps pendant lequel un soldat est exposé au feu ennemi (les drapeaux se trouvent généralement en terrain découvert et largement exposés)."
                                            "L'autre moyen est de tuer des soldats ennemis. Chaque fois qu'un soldat ennemi meurt, son équipe perd un ticket."
                                            "Attention cependant, un médecin peut ranimer un soldat allié avec son défibrillateur, pendant un temps de 15 secondes par défaut."
                                            "S'il le fait, l'équipe ne perd pas son ticket. Cependant le joueur ayant abattu le soldat ranimé garde ses points de tuerie."
                                            "Battlefield 2 est également jouable seul contre des bots. Cette partie du jeu n'est pas très développée et est là essentiellement pour apprendre à jouer (en particulier avec les véhicules aériens) et contrôler un FPS.",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ));
  }
}