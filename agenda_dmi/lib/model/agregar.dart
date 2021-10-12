import 'package:agenda_dmi/pages/home.dart';
import 'package:flutter/material.dart';
import 'Datos_Contactos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:agenda_dmi/pages/home.dart';
import 'controllers.dart';
import 'package:flutter/services.Dart';

class Agregar extends StatefulWidget {
  // String idcontacto;
  // String nombrecontacto;
  // String telefono;
  // String apellido;
  // String email;
  // Contacto(this.idcontacto, this.nombrecontacto, this.telefono, this.apellido,
  //     this.email);
  @override
  _CreateContacts createState() => _CreateContacts();
}

class _CreateContacts extends State<Agregar> {
  late TextEditingController nameTextController;
  late TextEditingController apellidoTextController;
  late TextEditingController celularTextController;
  late TextEditingController emailTextController;
  late TextEditingController user_idTextController;
  late String cel;
  late String nm;
  late String ap;
  late String correo;
  late String user_id;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nuevo Contacto'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(labelText: "Celular"),
                      initialValue: '',
                      onSaved: (value) {
                        cel = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      initialValue: '',
                      onSaved: (value) {
                        correo = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Nombre"),
                      initialValue: '',
                      onSaved: (value) {
                        nm = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Apellido"),
                      initialValue: '',
                      onSaved: (value) {
                        ap = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(labelText: "User ID"),
                      initialValue: '1',
                      onSaved: (value) {
                        user_id = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Agregar'),
                      onPressed: () {
                        setState(() {
                          _addContacts(context);
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ))));
  }

  void _addContacts(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      createcontact(this.nm, this.ap, this.correo, this.cel, this.user_id);
      // Navigator.of(context).Push(new MaterialPageRoute(builder: (context) => HomePage())).whenComplete(retrieveData);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context)
      //     .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      //   return new HomePage();
      // }));
    }
  }
}
