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
  // ignore: body_might_complete_normally_nullable
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
              String nam = _filter[index].name;
              var ruta = _filter[index].Polyline;
              //print(ruta);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowLinea(lin: ruta, name: nam)));
            },
          );
        }
    );
  }
}

class ShowLinea extends StatefulWidget {
  String name;
  var lin;

  ShowLinea({Key? key, required this.lin, required this.name})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _ShowLineaState createState() => _ShowLineaState();
}

class _ShowLineaState extends State<ShowLinea> {
  @override
  Widget build(BuildContext context) {
    var linea = widget.lin;
    String nombre = widget.name;

    final List<Rutas> select = [
      Rutas("ida", linea),
      Rutas("vuelta", linea),
      Rutas("ambas", linea)
    ];
    final List<ida> ini = [
      ida("linea 1", linea01I),
      ida("linea 2", linea02I),
      ida("linea 5", linea05I),
      ida("linea 8", linea08I),
      ida("linea 9", linea09I),
      ida("linea 10", linea10I),
      ida("linea 11", linea11I),
      ida("linea 16", linea16I),
      ida("linea 17", linea17I),
      ida("linea 18", linea18I),
    ];
    final List<vuelta> fin = [
      vuelta("linea 1", linea01V),
      vuelta("linea 2", linea02V),
      vuelta("linea 5", linea05V),
      vuelta("linea 8", linea08V),
      vuelta("linea 9", linea09V),
      vuelta("linea 10", linea10V),
      vuelta("linea 11", linea11V),
      vuelta("linea 16", linea16V),
      vuelta("linea 17", linea17V),
      vuelta("linea 18", linea18V),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text("Seleccione una ruta"),
        ),
      ),
      body: ListView.builder(
        itemCount: select.length,
        itemBuilder: (_, index) {
          return ListTile(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text(select[index].name),
            onTap: () {
              var sel = select[index].Polyline;
              if (select[index].name == "ida") {
                for (int i = 0; i < ini.length; i++) {
                  if (nombre == ini[i].name) {
                    List<LatLng> a = ini[i].ini as List<LatLng>;
                    List<LatLng> b = a;
                    final Set<Polyline> sel = {
                      Polyline(
                          points: a,
                          polylineId: const PolylineId("ida"),
                          width: 3,
                          color: const Color.fromARGB(255, 4, 111, 53)),
                    };
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RutaPage(
                                  lin: sel,
                                  inicio: a[0],
                                  fin: b[a.length - 1],
                                )));
                  }
                }
              } else if (select[index].name == "vuelta") {
                for (int i = 0; i < fin.length; i++) {
                  if (nombre == fin[i].name) {
                    List<LatLng> a = fin[i].fin as List<LatLng>;
                    List<LatLng> b = a;
                    final Set<Polyline> sel = {
                      Polyline(
                          points: a,
                          polylineId: const PolylineId("vuelta"),
                          width: 3,
                          color: const Color.fromARGB(255, 119, 4, 4))
                    };
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RutaPage(
                                  lin: sel,
                                  inicio: a[0],
                                  fin: b[a.length - 1],
                                )));
                  }
                }
              } else if (select[index].name == "ambas") {
                sel = select[index].Polyline;
                for (int i = 0; i < ini.length; i++) {
                  if (nombre == ini[i].name) {
                    List<LatLng> com = ini[i].ini as List<LatLng>;
                    List<LatLng> ter = fin[i].fin as List<LatLng>;
                    List<LatLng> b = ter;
                    final Set<Polyline> sel = {
                      Polyline(
                          points: com,
                          polylineId: const PolylineId("ida"),
                          width: 3,
                          color: const Color.fromARGB(255, 4, 111, 53)),
                      Polyline(
                          points: ter,
                          polylineId: const PolylineId("vuelta"),
                          width: 3,
                          color: const Color.fromARGB(255, 119, 4, 4))
                    };
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RutaPage(
                                  lin: sel,
                                  inicio: com[0],
                                  fin: b[ter.length - 1],
                                )));
                  }
                }
              }
            },
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class RutaPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  LatLng inicio, fin;
  var lin;

  RutaPage(
      {Key? key, required this.lin, required this.inicio, required this.fin})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _RutasPageState createState() => _RutasPageState();
}

class _RutasPageState extends State<RutaPage> {
  final Set<Marker> markers = new Set();
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);
  // ignore: unused_field
  static const LatLng show = LatLng(-17.78629, -63.18117);

  void iniState() {
    super.initState();
  }

  Set<Marker> get getmarkers {
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId("inicio"),
        position: widget.inicio,
        // ignore: prefer_const_constructors
        infoWindow: InfoWindow(
          title: 'inicio',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
      markers.add(Marker(
        markerId: const MarkerId("fin"),
        position: widget.fin,
        infoWindow: const InfoWindow(
          title: "fin de la ruta",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
    return markers;
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
                  markers: getmarkers,
                ),
              ),
            ],
          ),
        ),
        const CollapsingNavigationDrawer(),
      ]),
    );
    // ignore: dead_code
  }
}
