import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/points/linea09.dart';

final Set<Polyline> linea09 = {
  Polyline(
    points: linea09I,
    polylineId: const PolylineId('L09I'),
    width: 2,
    color: const Color.fromARGB(255, 24, 121, 232),
  ),
  Polyline(
    points: linea09V,
    polylineId: const PolylineId('L09V'),
    width: 2,
    color: const Color.fromARGB(255, 119, 230, 15),
  ),
};
