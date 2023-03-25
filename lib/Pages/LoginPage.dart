import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  //final _formKey = GlobalKey<FormState>();
 // final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Backgroud.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child : Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    SizedBox(height: 80),
    Text(
    'Bienvenue !',
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    ),
            Text('\nVeuillez vous connecter ou \ncréer un nouveau compte \n pour utiliser lapplication. ',
              style : TextStyle (
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
        Form(
          key: GlobalKey<FormState>(),
          child: Column(
              children: <Widget>[
              TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: 'Adresse e-mail',
                hintText: 'Entrez votre adresse e-mail',
              ),
                ),
                ]
    ),
    ),
      SizedBox(height: 20),
      Form(
        key: GlobalKey<FormState>(),
        child: Column(
            children: <Widget>[
              TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre adresse e-mail',
                ),
              ),
            ]
        ),
      ),
      SizedBox(height: 60),
      Form(
        key: GlobalKey<FormState>(),
        child: Column(
            children: <Widget>[
              TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre adresse e-mail',
                  ),
                ),
              Image.asset('assets/image/blockbleu.png'),
            ]
              ),
      ),
          ]
        ),
      ),
    ),
    );
  }
}
