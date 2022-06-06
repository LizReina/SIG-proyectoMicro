import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';

final List<Polyline> linea02 = [
  Polyline(
      points: linea02I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 74, 176, 78)),
  Polyline(
      points: linea02V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 49, 106, 51)),
];
