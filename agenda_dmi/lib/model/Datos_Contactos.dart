class Datos_Contactos {
  late int id;
  late String nombre;
  late String apellido;
  late String telefono;
  late String email;
  late int user_id;

  Datos_Contactos(int id, String nombre, String apellido, String telefono,
      String email, int user_id);

  Datos_Contactos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    telefono = json['telefono'];
    email = json['email'];
    user_id = json['user_id'];
  }
}
