import 'dart:math';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/polylines/linea01.dart';
import 'package:proyecto_bus/routes/polylines/linea02.dart';
import 'package:proyecto_bus/routes/polylines/linea05.dart';
import 'package:proyecto_bus/routes/polylines/linea08.dart';
import 'package:proyecto_bus/routes/polylines/linea09.dart';
import 'package:proyecto_bus/routes/polylines/linea10.dart';
import 'package:proyecto_bus/routes/polylines/linea11.dart';
import 'package:proyecto_bus/routes/polylines/linea16.dart';
import 'package:proyecto_bus/routes/polylines/linea17.dart';
import 'package:proyecto_bus/routes/polylines/linea18.dart';

class RouteController {
  
  final Map<String, Set<Polyline>> rutas = {
    '1': linea01,
    '2': linea02,
    '5': linea05,
    '8': linea08,
    '9': linea09,
    '10': linea10,
    '11': linea11,
    '16': linea16,
    '17': linea17,
    '18': linea18
  };
  
  bool dentroRadio(double latO, double lngO, double latD, double lngD) {
    double radius = 0.002355222456223941;
    double distance = sqrt(pow((latD.abs() - latO.abs()), 2) + pow((lngD.abs() - lngO.abs()), 2));
    return (distance < radius);
  }

  Set<Polyline> obtPolylines(Circle circle) {
    Set<Polyline> list = {};
    rutas.forEach((key, value) {
      value.elementAt(0).points.forEach((element) {
        if (dentroRadio(circle.center.latitude, circle.center.longitude, element.latitude, element.longitude)) {
          list.add(value.elementAt(0));
        }
        if(dentroRadio(circle.center.latitude, circle.center.longitude, element.latitude, element.longitude)){
          list.add(value.elementAt(1));
        }
      });
    });
    return list;
  }

  List<Polyline> getPolylines(double latO, double lngO) {
    List<Polyline> list = [];
    List<Polyline> result = [];
    rutas.forEach((key, value) {
      value.elementAt(0).points.forEach((element) {
        if (dentroRadio(latO, lngO, element.latitude, element.longitude)) {
          list.add(value.elementAt(0));
        }
        if(dentroRadio(latO, lngO, element.latitude, element.longitude)){
          list.add(value.elementAt(1));
        }
      });
    });
    result = list.toSet().toList();
    return result;
  }
}