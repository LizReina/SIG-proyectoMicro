import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea16.dart';

final List<Polyline> linea16 = [
  Polyline(
    points: linea16I,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 197, 67, 67),
  ),
  Polyline(
    points: linea16V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 214, 166, 11),
  ),
];
