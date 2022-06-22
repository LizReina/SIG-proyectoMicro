// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable, must_be_immutable, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/lineas/rutas.dart';
import 'package:proyecto_bus/routes/polylines/linea01.dart';
import 'package:proyecto_bus/routes/polylines/linea02.dart';
import 'package:proyecto_bus/routes/polylines/linea05.dart';
import 'package:proyecto_bus/routes/polylines/linea08.dart';
import 'package:proyecto_bus/routes/polylines/linea09.dart';
import 'package:proyecto_bus/routes/polylines/linea10.dart';
import 'package:proyecto_bus/routes/polylines/linea11.dart';
import 'package:proyecto_bus/routes/polylines/linea16.dart';
import 'package:proyecto_bus/routes/polylines/linea17.dart';
import 'package:proyecto_bus/routes/polylines/linea18.dart';
import 'package:proyecto_bus/variables.dart';
import 'package:proyecto_bus/widgets/collapsing_navigation_drawer.dart';

class ShowLineaPage extends StatefulWidget {
  const ShowLineaPage({Key? key}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State {

  @override
  Widget build(BuildContext context) {
    final List<Rutas> linea = [
      Rutas("Linea 1", linea01),
      Rutas('Linea 2', linea02),
      Rutas('Linea 5', linea05),
      Rutas('Linea 8', linea08),
      Rutas('Linea 9', linea09),
      Rutas('Linea 10', linea10),
      Rutas('Linea 11', linea11),
      Rutas('Linea 16', linea16),
      Rutas('Linea 17', linea17),
      Rutas('Linea 18', linea18),
    ];

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            counter = 1;
            showSearch(
              context: context,
              delegate: SearchCountryDelegate(linea),
            );
          },
          title: const Text('Search'),
        ),
      ),
      body: ListView.builder(
        itemCount: linea.length,
        itemBuilder: (_, index) {
          return const ListTile(
            title: Text(""),
          );
        }
      ),
    );
  }
}

class SearchCountryDelegate extends SearchDelegate<Rutas> {
  final List<Rutas> linea;
  List<Rutas> _filter = [];
  SearchCountryDelegate(this.linea);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, Rutas('', {}));
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = linea.where((linea) {
      return linea.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].name),
          onTap: () {
            var ruta = _filter[index].polyline;
            Set<Marker> markers = {};
            for (var element in ruta) {
              Set<Marker> puntos = { 
                Marker(
                  markerId: MarkerId('${element.polylineId.value}Partida'),
                  position: element.points.first,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  infoWindow: const InfoWindow(title: 'Partida'),
                ),
                Marker(
                  markerId: MarkerId('${element.polylineId.value}Llegada'),
                  position: element.points.last,
                  infoWindow: const InfoWindow(title: 'Llegada'),
                ),
              };
              markers.addAll(puntos);
            }
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => RutaPage(lin: ruta, markers: markers,)
            ));
          },
        );
      }
    );
  }
}

class RutaPage extends StatefulWidget {
  var lin;
  var markers;
  RutaPage({Key? key, required this.lin, this.markers}) : super(key: key);

  @override
  _RutasPageState createState() => _RutasPageState();
}

class _RutasPageState extends State<RutaPage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);

  @override
  void iniState() {
    var lin = widget.lin;
    var markers = widget.markers;
    counter = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var rut = widget.lin;
    var puntos = widget.markers;
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
                  polylines: rut,
                  markers: puntos,
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
