import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/polylines/all_lineas.dart';
import 'package:proyecto_bus/widgets/collapsing_navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 17);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Flexible(
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  myLocationButtonEnabled: true,
                  polylines: rutas,
                ),
              ),
            ],
          ),
        ),
        const CollapsingNavigationDrawer(),
      ]),
    );
  }
}
