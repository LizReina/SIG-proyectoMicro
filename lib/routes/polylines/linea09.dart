import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea09.dart';

final List<Polyline> linea09 = [
  Polyline(
    points: linea09I,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 24, 121, 232),
  ),
  Polyline(
    points: linea09V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 119, 230, 15),
  ),
];
