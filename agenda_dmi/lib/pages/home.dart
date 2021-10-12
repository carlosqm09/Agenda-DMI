import 'dart:async';
import 'dart:convert';
import 'package:agenda_dmi/model/Datos_Contactos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agenda_dmi/model/editar.dart';
import 'package:agenda_dmi/model/agregar.dart';

import 'package:agenda_dmi/model/controllers.dart';

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
  List<Datos_Contactos> data = <Datos_Contactos>[];
  Future<List<Datos_Contactos>> getData() async {
    var response = await http.get(
        Uri.parse("https://agendaprueba.herokuapp.com/contacts"),
        headers: {
          "Accept": "application/json",
        });

    var datos = jsonDecode(response.body);
    late var registros = <Datos_Contactos>[];
    for (datos in datos) {
      registros.add(Datos_Contactos.fromJson(datos));
    }

    return registros;
  }

  @override
  void initState() {
    // TODO: implement initState
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
          title: Text("Lista De Contactos"),
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
                              var nombrecontacto = data[index].nombre;
                              // var idcon = data[index].id;
                              var telefono = data[index].telefono;
                              var apellido = data[index].apellido;
                              var email = data[index].email;
                              String idcontacto = data[index].id.toString();
                              String user_id = data[index].user_id.toString();
                              // nos vamos a otra pantalla de
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return new Contacto(idcontacto, nombrecontacto,
                                    telefono, apellido, email, user_id);
                              }));
                              // print(data[index].id);
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
                                    data[index].nombre,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    data[index].apellido,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    data[index].telefono,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green),
                                  ),
                                  Text(
                                    data[index].email,
                                    style: TextStyle(fontSize: 16),
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
            accountName: Text("UTM APP", style: TextStyle(color: Colors.black)),
            accountEmail: Text("jesus26conrrado@gmail.com",
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://pbs.twimg.com/profile_images/1080953228362055681/lr8IiMAP_400x400.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text(
                "Agregar",
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
            title: Text("Actualizar"),
            onTap: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
