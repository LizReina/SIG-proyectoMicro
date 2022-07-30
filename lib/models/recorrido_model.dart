class Bus {
  Bus({
    this.id,
    this.latitud,
    this.longitud,
    this.interno,
    this.tipo,
  });

  int? id;
  double? latitud;
  double? longitud;
  int? interno;
  String? tipo;
  
  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json["id"],
      latitud: json["latitud"],
      longitud: json["longitud"], 
      interno: json["interno"],
      tipo: json["tipo"],
    );
  }
}