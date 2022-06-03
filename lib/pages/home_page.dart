import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_bus/routes/points/linea01.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';

import 'package:proyecto_bus/routes/points/linea05.dart';
import 'package:proyecto_bus/routes/points/linea05V.dart';
import 'package:proyecto_bus/routes/points/linea08.dart';

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
<<<<<<< HEAD
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 128, 15, 15),
          elevation: 10,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text('App Pasajero'),
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          const DrawerHeader(
            // ignore: sort_child_properties_last
            child: Text('App Pasajero'),
            decoration: BoxDecoration(color: Color.fromARGB(255, 155, 79, 79)),
          ),
          ListTile(
              title: const Text('Recorrido de Líneas'),
              leading: Image.asset(
                'assets/images/bus_icon.png',
                height: 40.0,
                width: 40.0,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          const Divider(color: Colors.grey),
          ListTile(
              title: const Text('Perfil'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              }),
        ])),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(

                    //center: LatLng(-63.10867572,-17.78634613),

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
                          points: linea05I,
                          strokeWidth: 2.0,
                          color: Color.fromARGB(255, 250, 117, 8)),
                      Polyline(
                          points: linea05V,
                          strokeWidth: 2.0,
                          color: Color.fromARGB(255, 236, 25, 166)),
                      Polyline(
                          points: linea08I,
                          strokeWidth: 2.0,
                          color: Color.fromARGB(255, 51, 190, 233)),
                      Polyline(
                          points: linea08V,
                          strokeWidth: 2.0,
                          color: Color.fromARGB(255, 40, 209, 68)),
                    ]),
                  ],
                ),
              ),
            ],

          ),
          const CollapsingNavigationDrawer(),
        ] 
      ),
    );
  }
}
