import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';
import 'package:proyecto_bus/routes/points/linea18.dart';

final List<Polyline> linea18 = [
  Polyline(
    points: linea17V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 110, 42, 199),
  ),
  Polyline(
    points: linea18I,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 189, 21, 158),
  ),
  Polyline(
    points: linea18V,
    strokeWidth: 2.0,
    color: const Color.fromARGB(255, 42, 184, 210),
  ),
];
