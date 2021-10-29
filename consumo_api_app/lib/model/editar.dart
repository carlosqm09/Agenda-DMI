import 'package:agenda_dmi/pages/googleMaps.dart';
import 'package:agenda_dmi/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'controllers.dart';

class Students extends StatefulWidget {
  String id;
  String name;
  String grade;
  String group_;
  String email;
  String direccion;
  String lat;
  String long_;
  Students(this.id, this.name, this.grade, this.group_, this.email,
      this.direccion, this.lat, this.long_);
  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Students> {
  late String id;
  late String name;
  late String grade;
  late String group_;
  late String email;
  late String direccion;
  late String lat;
  late String long_;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Información del Estudiante: ' + widget.name),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Nombre:"),
                      initialValue: widget.name,
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Correo:"),
                      initialValue: widget.email,
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Grado:"),
                      initialValue: widget.grade,
                      onSaved: (value) {
                        grade = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Grupo:"),
                      initialValue: widget.group_,
                      onSaved: (value) {
                        group_ = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Dirección:"),
                      initialValue: widget.direccion,
                      onSaved: (value) {
                        direccion = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Latitud:"),
                      initialValue: widget.lat,
                      onSaved: (value) {
                        lat = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Longitud:"),
                      initialValue: widget.long_,
                      onSaved: (value) {
                        long_ = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        RaisedButton(
                          padding: EdgeInsets.all(15),
                          child: Text('Actualizar Información'),
                          onPressed: () {
                            setState(() {
                              _showSecondPage(context);
                            });
                            // Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: 30),
                        RaisedButton(
                          child: Text('Eliminar Estudiante'),
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
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Ver dirección'),
                      color: Colors.green[800],
                      textColor: Colors.white,
                      onPressed: () {
                        _seeMaps(context);
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ))));
  }

  void _showSecondPage(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      updateStudents(widget.id, this.name, this.grade, this.group_, this.email,
          this.direccion, this.lat, this.long_);
      // Navigator.pop(context);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void _deletes(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      deleteStudents(widget.id);

      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return HomePage();
      }));
    }
  }

  void _seeMaps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return GoogleMaps(widget.lat, widget.long_, widget.name);
    }));
  }
}
