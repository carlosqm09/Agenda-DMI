import 'package:agenda_dmi/pages/home.dart';
import 'package:flutter/material.dart';
import 'Datos_Contactos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'controllers.dart';

class Contacto extends StatefulWidget {
  String idcontacto;
  String nombrecontacto;
  String telefono;
  String apellido;
  String email;
  String user_id;
  Contacto(this.idcontacto, this.nombrecontacto, this.telefono, this.apellido,
      this.email, this.user_id);
  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Contacto> {
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
          title: Text('Dato del contacto: ' +
              widget.nombrecontacto +
              ' ' +
              widget.apellido),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Celular"),
                      initialValue: widget.telefono,
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
                      initialValue: widget.email,
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
                      initialValue: widget.nombrecontacto,
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
                      initialValue: widget.apellido,
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
                      decoration: InputDecoration(labelText: "User ID"),
                      initialValue: "1",
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
                      child: Text('Actualizar'),
                      onPressed: () {
                        setState(() {
                          _showSecondPage(context);
                        });

                        // Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Eliminar'),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _deletes(context);
                        });

                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ))));
  }

  void _showSecondPage(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      updateContacto(widget.idcontacto, this.ap, this.nm, this.correo, this.cel,
          this.user_id);
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new HomePage();
      }));
    }
  }

  void _deletes(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      deletecontacto(widget.idcontacto);

      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new HomePage();
      }));
    }
  }
}
