import 'package:agenda_dmi/pages/googleMaps.dart';
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
      routes: {"/": (_) => HomePage()},
    );
  }
}
