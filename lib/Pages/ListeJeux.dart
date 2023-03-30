import 'package:flutter/material.dart';


class ListeJeux extends StatelessWidget {
  final List detailsJeux = [
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mei",
    "Juin",
    "Juillet",
    "Aout",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.builder"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(detailsJeux[index], style: TextStyle(fontSize: 30)),
            ),
          );
        },
        itemCount: detailsJeux.length,
      ),
    );
  }
}