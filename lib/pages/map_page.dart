import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(-17.78629, -63.18117),
    zoom: 15
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition
      ),
    );
  }
}
