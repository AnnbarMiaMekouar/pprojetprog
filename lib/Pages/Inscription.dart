import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pprojet/Pages/Accueil.dart';
import 'package:pprojet/Pages/color.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);


  @override
  _InscriptionState createState() => _InscriptionState();

}

class _InscriptionState extends State<Inscription> {
  final formKey = GlobalKey<FormState>();
  final autentification = FirebaseAuth.instance;
  final TextEditingController nomUtilisateurController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController motDePasseController = TextEditingController();
  final TextEditingController verifMotDePasseController = TextEditingController();
  bool isTextFieldEmpty = false;

  void initState(){
    super.initState();
    nomUtilisateurController.addListener(() {
      setState(() {
        isTextFieldEmpty = nomUtilisateurController.text.isEmpty;
      });
    });
    emailController.addListener(() {
      setState(() {
        isTextFieldEmpty = emailController.text.isEmpty;
      });
    });
    motDePasseController.addListener(() {
      setState(() {
        isTextFieldEmpty = motDePasseController.text.isEmpty;
      });
    });
    verifMotDePasseController.addListener(() {
      setState(() {
        isTextFieldEmpty = verifMotDePasseController.text.isEmpty;
      });
    });
}
  Future<bool> createUser(String email, String password) async {
    try {
      await autentification.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Accueil()),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Le mot de passe est trop faible.');
      } else if (e.code == 'email-already-in-use') {
        print('L\'e-mail est déjà utilisé.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
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
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: nomUtilisateurController,
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
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey.shade900,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: const OutlineInputBorder(),
                              hintText: 'Nom Utilisateur',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: emailController,
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
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey.shade900,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: const OutlineInputBorder(),
                              hintText: 'E-mail',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
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
                          controller: verifMotDePasseController,
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
                            backgroundColor: color_2,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 10)),
                        child: Text('Inscription'),
                        onPressed: isTextFieldEmpty
                            ? null
                            : () async {
                          bool result = await createUser(
                              emailController.text, motDePasseController.text);
                          if (result) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Accueil()),
                            );
                          } else {
                            // Gérer l'échec de l'inscription ici, par exemple en affichant un message d'erreur
                          }
                        },
                      ),
                    ),
                  ]
              ),
            )
        )
    );
  }
}
