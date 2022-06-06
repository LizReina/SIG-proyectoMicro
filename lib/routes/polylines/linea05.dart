import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea05.dart';
import 'package:proyecto_bus/routes/points/linea05V.dart';

final List<Polyline> linea05 = [
  Polyline(
      points: linea05I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 129, 35, 146)),
  Polyline(
      points: linea05V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 227, 146, 25)),
];
