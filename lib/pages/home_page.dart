// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong2/latlong.dart';

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              // ignore: sort_child_properties_last
              child: Text('App Pasajero'),
              decoration: BoxDecoration(color: Color.fromARGB(255, 155, 79, 79)),
            ),
            ListTile(
              title: const Text('Recorrido de Líneas'),
              leading: Image.asset('assets/images/bus_icon.png', height: 40.0, width: 40.0,),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            const Divider(color: Colors.grey),
            ListTile(
              title: const Text('Perfil'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              }
            ),
          ]
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                center: LatLng(32.91081899999999, -92.734876),
                zoom: 9.0,
                plugins: [EsriPlugin()],
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                  ),
                  FeatureLayerOptions(
                    //aquí va la url del proyecto arcmap
                    "https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Congressional_Districts/FeatureServer/0",
                    "polygon",
                    onTap: (dynamic attributes, LatLng location) {
                      // ignore: avoid_print
                      print(attributes);
                    },
                    render: (dynamic attributes){
                      // You can render by attribute
                      return const PolygonOptions(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 2
                      );
                    },
                  ),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}