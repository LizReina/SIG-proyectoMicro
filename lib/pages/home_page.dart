import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_bus/routes/polylines/all_lineas.dart';
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
      body: Stack(
        children: <Widget> [
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
                      urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    PolylineLayerOptions(
                      polylines: rutas
                    ),
                  ],),
                ),
              ],
            ),
          ),
          const CollapsingNavigationDrawer(),
        ] 
      ),
    );
  }
}










  