import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea10.dart';

final List<Polyline> linea10 = [
  Polyline(
    points: linea10I,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 29, 213, 173),
  ),
  Polyline(
    points: linea10V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 236, 215, 55),
  ),
];
