// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable, must_be_immutable, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_local_variable, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:proyecto_bus/pages/select_dir_page.dart';
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

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

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
              String nombre = _filter[index].name;
              var ruta = _filter[index].polyline;
              debugPrint(nombre);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowLinea(lin: ruta, name: nombre)));
            },
          );
        }
    );
  }
}


/*
class ShowLinea extends StatefulWidget {
  String name;
  var lin;

  ShowLinea({Key? key, required this.lin, required this.name})
      : super(key: key);
  @override
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
    final List<Ida> ini = [
      Ida("linea 1", linea01I),
      Ida("linea 2", linea02I),
      Ida("linea 5", linea05I),
      Ida("linea 8", linea08I),
      Ida("linea 9", linea09I),
      Ida("linea 10", linea10I),
      Ida("linea 11", linea11I),
      Ida("linea 16", linea16I),
      Ida("linea 17", linea17I),
      Ida("linea 18", linea18I),
    ];
    final List<Vuelta> fin = [
      Vuelta("linea 1", linea01V),
      Vuelta("linea 2", linea02V),
      Vuelta("linea 5", linea05V),
      Vuelta("linea 8", linea08V),
      Vuelta("linea 9", linea09V),
      Vuelta("linea 10", linea10V),
      Vuelta("linea 11", linea11V),
      Vuelta("linea 16", linea16V),
      Vuelta("linea 17", linea17V),
      Vuelta("linea 18", linea18V),
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
            title: Text(select[index].name),
            onTap: () {
              var sel = select[index].polyline;
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
                sel = select[index].polyline;
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
*/