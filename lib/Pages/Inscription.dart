import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Backgroud.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 7),
                    Text(
                      'Inscription !',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\nVeuillez saisir ces différentes informations, \n afin que vos listes soient sauvegardées. ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      child: Column(children: <Widget>[
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                )),
                            filled: true,
                            fillColor: Colors.blueGrey.shade900,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: const OutlineInputBorder(),
                            hintText: 'Nom Utilisateur',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 20),
                    Form(
                      child: Column(children: <Widget>[
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                )),
                            filled: true,
                            fillColor: Colors.blueGrey.shade900,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: const OutlineInputBorder(),
                            hintText: 'E-mail',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ]
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                        child: Column(children: <Widget>[
                          TextFormField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade900,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  )
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey.shade900,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: const OutlineInputBorder(),
                              hintText: 'Mot de passe',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ]
                        )
                    ),

                    SizedBox(height: 20),
                    Form(
                      child: Column(children: <Widget>[
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                color: Colors.blueGrey.shade900,
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
                            hintText: 'Verification du mot de passe',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ]
                      ),
                    ),
                    SizedBox(height: 68),
                    SizedBox(
                      height: 68,
                      width: 320,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(104, 108, 244, 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 29, vertical: 10)),
                          child: Text('Inscription'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Accueil()),
                            );
                          }
                          ),
                    ),
                  ]
              ),
            )
        )
    );
  }
}
