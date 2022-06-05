import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_bus/routes/points/linea01.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';
import 'package:proyecto_bus/routes/points/linea09.dart';
import 'package:proyecto_bus/routes/points/linea10.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';
import 'package:proyecto_bus/routes/points/linea18.dart';
import 'package:proyecto_bus/widgets/collapsing_navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: drawerBackgroundColor,       
        elevation: 10,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('App Pasajero'),
      ),*/
      body: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(-17.78629, -63.18117),
                    zoom: 13.0,
                    plugins: [EsriPlugin()],
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    PolylineLayerOptions(polylines: [
                      Polyline(
                          points: linea01I,
                          strokeWidth: 2.0,
                          color: Colors.blue),
                      Polyline(
                          points: linea01V,
                          strokeWidth: 2.0,
                          color: const Color.fromARGB(255, 14, 75, 125)),
                      Polyline(
                          points: linea02I,
                          strokeWidth: 2.0,
                          color: Colors.green),
                      Polyline(
                          points: linea02V,
                          strokeWidth: 2.0,
                          color: Colors.orange),
                      Polyline(
                        points: linea09I,
                        strokeWidth: 2.0,
                        color: Color.fromARGB(255, 202, 213, 42),
                      ),
                      Polyline(
                        points: linea09V,
                        strokeWidth: 2.0,
                        color: Colors.orange,
                      ),
                      Polyline(
                        points: linea10I,
                        strokeWidth: 2.0,
                        color: Color.fromARGB(255, 136, 89, 238),
                      ),
                      Polyline(
                        points: linea10V,
                        strokeWidth: 2.0,
                        color: Color.fromARGB(255, 236, 74, 74),
                      ),
                      Polyline(
                        points: linea17I,
                        strokeWidth: 2.0,
                        color: Colors.indigo.shade200,
                      ),
                      Polyline(
                        points: linea17V,
                        strokeWidth: 2.0,
                        color: Colors.indigo.shade400,
                      ),
                      Polyline(
                        points: linea18I,
                        strokeWidth: 2.0,
                        color: Colors.brown,
                      ),
                      Polyline(
                        points: linea18V,
                        strokeWidth: 2.0,
                        color: Colors.brown.shade400,
                      ),
                    ]),
                  ],
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
