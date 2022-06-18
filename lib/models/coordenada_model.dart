class Coordenada {
  Coordenada({
    required this.id,
    required this.latitud,
    required this.longitud
  });
  
  final int id;
  final double latitud;
  final double longitud;

  factory Coordenada.fromMap(Map<String, dynamic> json) => Coordenada(
    id: json["id"],
    latitud: json["latitud"],
    longitud: json["longitud"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "latitud": latitud,
    "longitud": longitud
  };
}