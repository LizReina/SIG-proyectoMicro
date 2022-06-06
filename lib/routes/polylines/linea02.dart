import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';

final Set<Polyline> linea02 = {
  Polyline(
    polylineId: const PolylineId('L02I'),
    width: 2,
    points: linea02I,
    color: const Color.fromARGB(255, 74, 176, 78)
  ),
  Polyline(
    polylineId: const PolylineId('L02V'),
    points: linea02V,
    width: 2,
    color: const Color.fromARGB(255, 49, 106, 51)
  ),
};