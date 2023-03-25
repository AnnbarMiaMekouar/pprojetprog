import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue sur JCVD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Homepage'),
            ElevatedButton(
              child: Text('Search'),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ElevatedButton(
              child: Text('Wishlist'),
              onPressed: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
          ],
        ),
      ),
    );
  }
}