import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';

final Set<Polyline> linea17 = {
  Polyline(
    points: linea17I,
    polylineId: const PolylineId('L17I'),
    width: 2,
    color: const Color.fromARGB(255, 236, 74, 228),
  ),
  Polyline(
    points: linea17V,
    polylineId: const PolylineId('L17V'),
    width: 2,
    color: const Color.fromARGB(255, 110, 42, 199),
  ),
};
