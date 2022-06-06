import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea01.dart';

final List<Polyline> linea01 = [
  Polyline(
      points: linea01I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 14, 75, 125)),
  Polyline(
      points: linea01V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 108, 184, 245)),
];
