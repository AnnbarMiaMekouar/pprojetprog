import 'package:flutter/material.dart' ;

class WhishList extends StatelessWidget {
  const WhishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ma liste de souhaits"),

        ),
        body: Center(
            child:ListView(
                children: [

                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/Minecraft.jpeg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('MINECRAFT'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Markus Persson'),
                          Text('Prix : 23.99€ '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/lol.png',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('LEAGUE OF LEGENDS'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tom Cadwell'),
                          Text('Prix : Gratuit '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/overwatch2.jpeg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('OVERWATCH 2'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Jeremy Craig, Scott Mercer, Michael Elliot'),
                          Text('Prix : gratuit '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/valorant.jpg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('VALORANT'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Riot Games'),
                          Text('Prix : gratuit '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/WoW.jpg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('WORLD OF WARCRAFT : DRAGONFLIGHT'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Sam Vostok'),
                          Text('Prix : 41.24€ '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/gta.jpg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('GTA 5'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Leslie Benzies, Imran Sarwar'),
                          Text('Prix : 19.99€ '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/Fortnite.jpeg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('FORTNITE'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Epic Games'),
                          Text('Prix : gratuit '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/COD.jpg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('CALL OF DUTY : WARZONE 2.0'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Infinity Ward, Raven Software'),
                          Text('Prix : gratuit (version payante à 9.99€)'),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/apex.jpg',
                        width: 50, // set the width to 80 pixels
                        height: 50, // set the height to 80 pixels
                      ),
                      title: Text('APEX LEGENDS'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Mackey McCandlish'),
                          Text('Prix : gratuit '),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),


                ]
            )
        )
    );
  }
}