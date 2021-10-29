class Datos_Students {
  late int id;
  late String name;
  late int grade;
  late String group_;
  late String email;
  late String direccion;
  late String lat;
  late String long_;

  Datos_Students(int id, String name, String grade, String group_, String email,
      String direccion, String lat, String long_);

  Datos_Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    grade = json['grade'];
    group_ = json['group_'];
    email = json['email'];
    direccion = json['direccion'];
    lat = json['lat'];
    long_ = json['long_'];
  }
}
