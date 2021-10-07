import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  ///
  /// Clase Singleton para mantener el estado de manera global en todo el proyecto
  ///

  static PreferenciasUsuario? _internal;

  PreferenciasUsuario._();

  static PreferenciasUsuario get instance {
    if (_internal == null) {
      _internal = new PreferenciasUsuario._();
    }

    return _internal!;
  }
}
