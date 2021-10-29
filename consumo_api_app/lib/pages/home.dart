import 'dart:async';
import 'dart:convert';
import 'package:agenda_dmi/model/Datos_Contactos.dart';
import 'package:agenda_dmi/pages/googleMaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:agenda_dmi/model/editar.dart';
import 'package:agenda_dmi/model/agregar.dart';

// void main() {
//   runApp(new MaterialApp(
//     home: new HomePage(),
//   ));
// }

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool loading = true;
  List<Datos_Students> data = <Datos_Students>[];
  Future<List<Datos_Students>> getData() async {
    var url = Uri.parse('https://api-students-10a.herokuapp.com/students');
    var response = await http.get(url, headers: {
      "Accept": "application/json",
    });

    var datos = jsonDecode(response.body);
    late var registros = <Datos_Students>[];
    for (datos in datos) {
      registros.add(Datos_Students.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data.addAll(value);
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Lista De Estudiantes"),
        ),
        drawer: MenuLateral(),
        body: Column(
          children: [
            Expanded(
                child: loading == true
                    ? Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              var name = data[index].name;
                              String grade = data[index].grade.toString();
                              var group_ = data[index].group_;
                              var email = data[index].email;
                              String id = data[index].id.toString();
                              var direccion = data[index].direccion;
                              var lat = data[index].lat;
                              var long_ = data[index].long_;
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return new Students(id, name, grade, group_,
                                    email, direccion, lat, long_);
                              }));
                              // .then((value) => setState(() {
                              //       getData().then((value) {
                              //         setState(() {
                              //           data.addAll(value);
                              //           loading = false;
                              //         });
                              //       });
                              //     }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.blue, width: 1))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].id.toString() +
                                        ".- " +
                                        data[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Correo: " + data[index].email,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green),
                                  ),
                                  Text(
                                    "Grado: " + data[index].grade.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Grupo: " + data[index].group_,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    data[index].direccion,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red[800]),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ))
          ],
        ));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("CRUD de estudiantes API",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            accountEmail:
                Text("Eduardo Gamboa", style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text(
                "Agregar nuevos estudiantes",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new Agregar();
                }));
              },
            ),
          ),
          new ListTile(
            title: Text("Salir de la APP"),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
          new ListTile(
            title: Text("Actualizar"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new HomePage();
              }));
            },
          ),
          // new ListTile(
          //   title: Text("Ver Mapa We"),
          //   onTap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute<Null>(builder: (BuildContext context) {
          //       return new GoogleMaps();
          //     }));
          //   },
          // ),
        ],
      ),
    );
  }
}
