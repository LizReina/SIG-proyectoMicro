import 'package:proyecto_bus/models/coordenada_model.dart';

class Ruta {
  Ruta({
    required this.id,
    required this.tipo,
    required this.coordenadas,
  });

  final int id;
  final String tipo;
  final List<Coordenada> coordenadas;

  factory Ruta.fromMap(Map<String, dynamic> json) => Ruta(
    id: json["id"],
    tipo: json["tipo"],
    coordenadas: List<Coordenada>.from(json["coordenadas"].map((x) => Coordenada.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "tipo": tipo,
    "coordenadas": List<dynamic>.from(coordenadas.map((x) => x.toMap())),
  };
}