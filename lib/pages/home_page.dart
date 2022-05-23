// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,       
        elevation: 10,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('App Conductor'),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('App Pasajero'),
              decoration: BoxDecoration(color: Colors.black),
            ),
            ListTile(
              title: Text('Recorrido de Líneas'),
              leading: Image.asset('assets/images/bus_icon.png', height: 40.0, width: 40.0,),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            Divider(color: Colors.grey),
            ListTile(
              title: Text('Perfil'),
              leading: Image.asset('assets/images/bus_icon.png', height: 40.0, width: 40.0,),
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
                  zoom: 11.0,
                  plugins: [EsriPlugin()],
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    tileProvider: const CachedNetworkTileProvider(),
                  ),
                  FeatureLayerOptions(
                    url: "https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Congressional_Districts/FeatureServer/0",
                    geometryType:"polygon",
                    onTap: (attributes, LatLng location) {
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
                  FeatureLayerOptions(
                    url: "https://services8.arcgis.com/1p2fLWyjYVpl96Ty/arcgis/rest/services/Forest_Service_Recreation_Opportunities/FeatureServer/0",
                    geometryType:"point",
                    render:(dynamic attributes){
                      // You can render by attribute
                      return Marker(
                        width: 30.0,
                        height: 30.0,
                        builder: (ctx) => const Icon(Icons.pin_drop),
                      );
                    },
                    onTap: (attributes, LatLng location) {
                      // ignore: avoid_print
                      print(attributes);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}