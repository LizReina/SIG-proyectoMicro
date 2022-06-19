import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/routes/polylines/linea01.dart';
import 'package:proyecto_bus/routes/polylines/linea02.dart';
import 'package:proyecto_bus/routes/polylines/linea05.dart';
import 'package:proyecto_bus/routes/polylines/linea08.dart';
import 'package:proyecto_bus/routes/polylines/linea09.dart';
import 'package:proyecto_bus/routes/polylines/linea10.dart';
import 'package:proyecto_bus/routes/polylines/linea16.dart';
import 'package:proyecto_bus/routes/polylines/linea17.dart';
import 'package:proyecto_bus/routes/polylines/linea18.dart';
import '../routes/lineas/rutas.dart';
import '../routes/polylines/linea11.dart';
import '../widgets/collapsing_navigation_drawer.dart';

class ShowLineaPage extends StatefulWidget {
  const ShowLineaPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State {
  @override
  Widget build(BuildContext context) {
    final List<Rutas> linea = [
      Rutas("linea 1", linea01),
      Rutas('linea 2', linea02),
      Rutas('linea 5', linea05),
      Rutas('linea 8', linea08),
      Rutas('linea 9', linea09),
      Rutas('linea 10', linea10),
      Rutas('linea 11', linea11),
      Rutas('linea 16', linea16),
      Rutas('linea 17', linea17),
      Rutas('linea 18', linea18),
    ];
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
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
          }),
    );
  }
}

class SearchCountryDelegate extends SearchDelegate<Rutas> {
  // ignore: non_constant_identifier_names
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
    // ignore: todo
    // TODO: implement buildLeading
    IconButton(
      onPressed: () {
        close(context, Rutas('', 0));
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
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
    // TODO: implement buildSuggestions
    _filter = linea.where((linea) {
      return linea.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(_filter[index].name),
            onTap: () {
              var ruta = _filter[index].Polyline;
              //print(ruta);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RutaPage(
                            lin: ruta,
                          )));
            },
          );
        });
  }
}

class RutaPage extends StatefulWidget {
  var lin;
  RutaPage({Key? key, required this.lin}) : super(key: key);

  @override
  // TODO: implement createState
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _RutasPageState createState() => _RutasPageState();
}

class _RutasPageState extends State<RutaPage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);

  @override
  void iniState() {
    var lin = widget.lin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var rut = widget.lin;
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
