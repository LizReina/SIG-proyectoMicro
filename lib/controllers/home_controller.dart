// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/controllers/route_controller.dart';

class HomeController extends ChangeNotifier {
  RouteController ruta = RouteController();
  
  final Map<MarkerId, Marker> _markers = {};
  final Map<CircleId, Circle> _circles = {};

  Set<Marker> get markers => _markers.values.toSet();
  Set<Polyline> polylines = {};
  Set<Circle> circles = {};
  
  final initialCameraPosition = const CameraPosition(
    target: LatLng(-17.78629, -63.18117),
    zoom: 13
  );

  void onTap1(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      onTap: () {
        print('Latitud: ${position.latitude} Longitud: ${position.longitude}');
      },
      onDragEnd: (newPosition) {
        print("newPosition $newPosition");
      }
    );
    _markers[markerId] = marker;
    notifyListeners();
  }

  void onTap(LatLng position) {
    final circleId = CircleId(_circles.length.toString());
    final circle = Circle(
      circleId: circleId,
      center: position,
      radius: 100,
      fillColor: Colors.blue.shade100.withOpacity(0.5),
      strokeColor:  Colors.blue.shade100.withOpacity(0.1),
    );
    circles.add(circle);
    polylines = ruta.obtPolylines(circle);
    final container = Container(
      width: 20,
      height: 40,
    );
    notifyListeners();
  }
}