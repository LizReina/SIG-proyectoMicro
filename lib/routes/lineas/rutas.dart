// ignore_for_file: prefer_typing_uninitialized_variables

// ignore: unused_import
//import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Rutas {
  late final String name;
  // ignore: non_constant_identifier_names
  Set<Polyline> polyline;

  Rutas(this.name, this.polyline);
}
