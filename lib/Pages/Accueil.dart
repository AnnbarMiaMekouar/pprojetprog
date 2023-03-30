import 'package:flutter/material.dart';
import 'package:pprojet/Pages/WhishList.dart';
import 'package:pprojet/Pages/color.dart';


class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
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
            title: const Text('Accueil'),
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

        body : SingleChildScrollView(
            child : Column(
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
                        )
                    ),
                  ),
                  Card(
                    // margin: const EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/imageacceuil.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Titan Fall 2\n Ultimate Edition',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Vous suivrez l\'histoire \n d\'un militaire qui souhaite \n devenir pilote d\'élite à la Frontière?',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: color_2,
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 9, vertical:5)
                                  ),
                                  child: const Text('En savoir plus'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => WhishList()),
                                    );
                                  }
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    //padding: EdgeInsets.all(0.0),
                      child: Column (
                          children : [ Text('Les meilleures ventes',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          )
                          ]
                      )
                  ),
                  Card(
                      child: Container(
                        color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                  Card(
                      child: Container(
                          color: color_3,
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
                              height: 100.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: color_2,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(2),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WhishList()),
                                  );
                                },
                              ),
                            ),
                          )
                      )
                  ),
                ]
            )
        )
    );
  }
}
