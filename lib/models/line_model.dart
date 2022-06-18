import 'dart:convert';

import 'package:proyecto_bus/models/ruta_model.dart';

Linea lineaFromMap(String str) => Linea.fromMap(json.decode(str));
String lineaToMap(Linea data) => json.encode(data.toMap());

class Linea {
  Linea({
    required this.id,
    required this.nombre,
    required this.rutas,
  });
  
  final int id;
  final String nombre;
  final List<Ruta> rutas;
  
  factory Linea.fromMap(Map<String, dynamic> json) => Linea(
    id: json["id"],
    nombre: json["nombre"],
    rutas: List<Ruta>.from(json["rutas"].map((x) => Ruta.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nombre": nombre,
    "rutas": List<dynamic>.from(rutas.map((x) => x.toMap())),
  };
}