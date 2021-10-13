import 'package:agenda_dmi/pages/bienvenido.dart';
import 'package:agenda_dmi/pages/login.dart';
import 'package:agenda_dmi/tools/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:agenda_dmi/pages/home.dart';

// void main(List<String> args) async {
//   runApp(MyApp());
//   final prefs = PreferenciasUsuario.instance;

//   await Firebase.initializeApp();
//   await prefs.initPrefs();
// }

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: "Agenda",
      routes: {"/": (_) => LoginPage(), "/home": (_) => HomePage()},
    );
  }
}
