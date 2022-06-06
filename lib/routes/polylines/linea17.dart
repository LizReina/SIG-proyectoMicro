import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';

final List<Polyline> linea17 = [
  Polyline(
    points: linea17I,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 236, 74, 228),
  ),
  Polyline(
    points: linea17V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 110, 42, 199),
  ),
];
