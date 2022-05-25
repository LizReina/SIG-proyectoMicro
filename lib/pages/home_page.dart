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
  List<LatLng> points = [
    LatLng(-17.786346, -63.108676),
    LatLng(-17.726992, -63.138539),
  ];

  List<LatLng> pointsOrigin = [
    LatLng(-17.786346, -63.108676),
    LatLng(-17.854482, -63.204506),
    LatLng(-17.806066, -63.118662),
    LatLng(-17.838441, -63.223991),
    LatLng(-17.726992, -63.138539),
    LatLng(-17.825395, -63.234535),
    LatLng(-17.826003, -63.133771),
    LatLng(-17.828068, -63.137206),
    LatLng(-17.797149, -63.12091),
    LatLng(-17.77145, -63.209074),
    LatLng(-17.810668, -63.11915),
    LatLng(-17.810668, -63.11915),
    LatLng(-17.720281, -63.141763),
    LatLng(-17.823997, -63.09515),
    LatLng(-17.82419, -63.176843),
    LatLng(-17.726633, -63.133856),
    LatLng(-17.790669, -63.172084),
    LatLng(-17.791302, -63.17282),
    LatLng(-17.790669, -63.172084),
    LatLng(-17.791302, -63.17282),
  ];

  List<LatLng> pointsDestino = [
    LatLng(-17.726992, -63.138539),
    LatLng(-17.806066, -63.118662),
    LatLng(-17.803755, -63.089091),
    LatLng(-17.786483, -63.108174),
    LatLng(-17.727163, -63.134209),
    LatLng(-17.790871, -63.172311),
    LatLng(-17.790871, -63.172311),
    LatLng(-17.790871, -63.172311),
    LatLng(-17.790871, -63.172311),
    LatLng(-17.824283, -63.094988),
    LatLng(-17.754934, -63.157414),
    LatLng(-17.718046, -63.13867),
    LatLng(-17.824198, -63.177034),
    LatLng(-17.718156, -63.139334),
    LatLng(-17.771331, -63.208986),
    LatLng(-17.714817, -63.169081),
    LatLng(-17.714772, -63.16914),
    LatLng(-17.839014, -63.224893),
    LatLng(-17.854212, -63.204139),
    LatLng(-17.720281, -63.141763),
  ];

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
                  //center: LatLng(32.91081899999999, -92.734876),
                  center: LatLng(-17.78629, -63.18117),
                  zoom: 9.0,
                  plugins: [EsriPlugin()],
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                  ),
                  PolylineLayerOptions(
                    polylineCulling: true,
                    polylines: [Polyline(
                      points: points,
                      strokeWidth: 4.0,
                      color: Colors.red
                    ),]
                  ),
                  /*FeatureLayerOptions(
                    //aquí va la url del proyecto arcmap
                    "https://services3.arcgis.com/QNFahhdzhN4Dt0f7/arcgis/rest/services/ProyMicrobus/FeatureServer/0",
                    //"https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Congressional_Districts/FeatureServer/0",
                    "polyline",
                    onTap: (dynamic attributes, LatLng location) {
                      // ignore: avoid_print
                      print("Attributes. $attributes");
                      // ignore: avoid_print
                      print("Location: $location");
                      pointsOrigin.add(location);
                      // ignore: avoid_print
                      print("List: $pointsOrigin");
                    },
                    render: (dynamic attributes){
                      // You can render by attribute
                      return Polyline(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 2, 
                        points: pointsOrigin
                      );
                    },
                  ),*/
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}