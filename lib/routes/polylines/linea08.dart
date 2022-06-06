import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea08.dart';

final List<Polyline> linea08 = [
  Polyline(
      points: linea08I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 69, 196, 60)),
  Polyline(
      points: linea08V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 164, 25, 234)),
];
