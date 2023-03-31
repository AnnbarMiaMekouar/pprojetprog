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
      body: Container (
        color: color_3,
      child : Column (
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Bitmap-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column (
                  children : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 150),
                  ),
                    Card(
                    child: Container(

                        width: 360,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(5),
                          color: Colors.black38,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                              '',
                              width: 50),
                          title: Text(''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(''),
                              Text(''),
                            ],
                          ),
                          trailing : SizedBox(
                            width: 90.0,
                            height: 50.0,
                          ),
                        )
                    )
                ),
          ]
                )
              ],
            ),
          ),
        Container(
            color: Colors.blue,
          child : Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 150),


              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Texte gauche 1',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Texte gauche 2',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Texte droite 1',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Texte droite 2',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                    ),
          ]
              ),
          ) ),
          ]

      ),
      )
    );
  }
}
