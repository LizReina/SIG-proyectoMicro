import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto_bus/routes/points/linea01.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';
import 'package:proyecto_bus/routes/points/linea05.dart';
import 'package:proyecto_bus/routes/points/linea05V.dart';
import 'package:proyecto_bus/routes/points/linea08.dart';
import 'package:proyecto_bus/routes/points/linea09.dart';
import 'package:proyecto_bus/routes/points/linea10.dart';
import 'package:proyecto_bus/routes/points/linea16.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';
import 'package:proyecto_bus/routes/points/linea18.dart';

final List<Polyline> rutas = [
  Polyline(
      points: linea01I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 14, 75, 125)),
  Polyline(
      points: linea01V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 108, 184, 245)),
  Polyline(
      points: linea02I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 74, 176, 78)),
  Polyline(
      points: linea02V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 49, 106, 51)),
  Polyline(
      points: linea05I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 129, 35, 146)),
  Polyline(
      points: linea05V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 227, 146, 25)),
  Polyline(
      points: linea08I,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 69, 196, 60)),
  Polyline(
      points: linea08V,
      strokeWidth: 2.0,
      color: const Color.fromARGB(255, 164, 25, 234)),
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