import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'accueil.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';



//https://firebase.google.com/docs/auth/flutter/password-auth


class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);


  @override
  _InscriptionState createState() => _InscriptionState();

}

class _InscriptionState extends State<Inscription> {

  final nomUtilisateurController = TextEditingController();
  final emailController = TextEditingController();
  final verifMotDePasseController = TextEditingController();
  final motDePasseController = TextEditingController();

  bool isTextFieldEmpty = false;
  bool ismdp = true;
  bool ismdpcontour= false;

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

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<User?> createAccount( { required String nom, required String email, required String motdepasse,})
  async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: motdepasse,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Le mot de passe n est pas assez long ');

      } else if (e.code == 'email-already-in-use') {
        print('Il existe deja un compte associé a cette adresse mail');

      }
    } catch (e) {
      isTextFieldEmpty = true;
      print(e);
    }
    isTextFieldEmpty = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: SafeArea (
        child : LayoutBuilder (
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child : Container(
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
                                      controller: motDePasseController,
                                      onChanged: (value) {
                                        setState(() {
                                          ismdp = value.isEmpty;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          ismdpcontour = true;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                            color: ismdpcontour? Colors.blueGrey.shade900 : Colors.red,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.blueGrey.shade900,
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        border: const OutlineInputBorder(),
                                        hintText: 'Mot de passe',
                                        hintStyle: const TextStyle(color: Colors.white),
                                        suffixIcon: ismdp
                                            ? SvgPicture.asset(
                                          'assets/images/warning.svg',
                                          height: 5,
                                          width: 5,
                                        )
                                            : null,
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
                                    onPressed:  () async {
                                      if (isTextFieldEmpty == false) {
                                        createAccount(email: emailController.text,
                                          motdepasse: verifMotDePasseController.text,
                                          nom: nomUtilisateurController.text,);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Accueil()),);
                                      } else {
                                        _showSnackBar(
                                            "La création du compte a échoué. Veuillez vérifier vos identifiants et réessayer.");
                                      }
                                    }
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  )
              );
            }
        )
    )
    );
  }
}