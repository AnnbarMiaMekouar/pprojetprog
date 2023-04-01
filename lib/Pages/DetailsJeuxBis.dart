import 'package:flutter/material.dart';
import 'package:pprojet/Pages/WhishList.dart';
import 'package:pprojet/Pages/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsJeuxBis extends StatefulWidget {
  const DetailsJeuxBis({Key? key}) : super(key: key);

  @override
  _DetailsJeuxBisState createState() => _DetailsJeuxBisState();
}

class _DetailsJeuxBisState extends State<DetailsJeuxBis> {
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
    child: SingleChildScrollView(
    child : Column (
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                                    color: color_4,
                                    child: Container(
                                        width: 360,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.circular(5),
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
                                SizedBox(height: 16.0),
                                Container(
                                  height: 50.0, // définit la hauteur du container
                                  width: 350.0, // définit la largeur du container
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
                                    color: color_1,
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
              color: color_2,
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
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: color_4,
                                  child: Container(
                                    width: 360,
                                    height: 90,
                                    child: ListTile(
                                      title: Text('Titre de la card'),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Description de la card'),
                                          Text('Autre information'),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: 50.0,
                                        height: 8.0,
                                        child: SvgPicture.asset('assets/images/Group 10.svg'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: color_4,
                                  child: Container(
                                    width: 360,
                                    height: 90,
                                    child: ListTile(
                                      title: Text('Titre de la card'),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Description de la card'),
                                          Text('Autre information'),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: 50.0,
                                        height: 8.0,
                                        child: SvgPicture.asset('assets/images/Group 10.svg'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: color_4,
                                  child: Container(
                                    width: 360,
                                    height: 90,
                                    child: ListTile(
                                      title: Text('Titre de la card'),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Description de la card'),
                                          Text('Autre information'),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: 50.0,
                                        height: 8.0,
                                        child: SvgPicture.asset('assets/images/Group 10.svg'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: color_4,
                                  child: Container(
                                    width: 360,
                                    height: 100,
                                    child: ListTile(
                                      title: Text('Titre de la card'),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Description de la card'),
                                          Text('Autre information'),
                                        ],
                                      ),
                                      trailing: SizedBox(
                                        width: 90.0,
                                        height: 50.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          )
                        ]
                    ),
                  )
                ]
            )
        )
    )
    );
  }
}
