// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/controllers/route_controller.dart';

class HomeController extends ChangeNotifier {
  RouteController ruta = RouteController();
  
  final Map<CircleId, Circle> _circles = {};

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Circle> circles = {};
  List<Polyline> listpoly = [];
  
  final initialCameraPosition = const CameraPosition(
    target: LatLng(-17.78629, -63.18117),
    zoom: 13
  );

  void onTap(LatLng position) {
    final circleId = CircleId(_circles.length.toString());
    final circle = Circle(
      circleId: circleId,
      center: position,
      radius: 120,
      fillColor: Colors.blue.shade100.withOpacity(0.5),
      strokeColor:  Colors.blue.shade100.withOpacity(0.1),
    );
    circles.add(circle);
    polylines = ruta.obtPolylines(circle);
    listpoly = ruta.getPolylines(circle.center.latitude, circle.center.longitude);
    markers = ruta.getMarkers(polylines);
    notifyListeners();
  }
}