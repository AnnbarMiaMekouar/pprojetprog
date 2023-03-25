import 'package:flutter/material.dart';
import 'package:pprojet/Pages/LoginPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JCVD Jeux Vidéos',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );//Material APP
  }
}

