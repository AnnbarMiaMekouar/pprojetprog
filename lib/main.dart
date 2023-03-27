import 'package:flutter/material.dart';
import 'package:pprojet/Pages/LoginPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class ConnectUserEvent extends UserEvent {}

class DisconnectUserEvent extends UserEvent {}

// State
class UserState {
  final bool connected;

  UserState(this.connected);
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(false)) {
    on<ConnectUserEvent>(_onConnect);
    on<DisconnectUserEvent>(_onDisconnect);
  }

  Future<void> _onConnect(event, emit) async {
    emit(UserState(true));
  }

  Future<void> _onDisconnect(event, emit) async {
    emit(UserState(false));
  }
}

// Ecrans

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (BuildContext context, UserState state) {
          if (state.connected) {
            _navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Accueil(),
              ),
            );
            // Accueil
          } else {
            // Connexion
            _navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Jeux Vidéos',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        ),
      ),
    );
  }
}

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(ConnectUserEvent());
        },
        child: Text("Connexion"),
      ),
    );
  }
}

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(DisconnectUserEvent());
        },
        child: Text("Se déconnecter"),
      ),
    );
  }
}

