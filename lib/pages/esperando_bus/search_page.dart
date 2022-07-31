// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/pages/esperando_bus/selectipo_page.dart';
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

class BuscarPage extends StatefulWidget {
  const BuscarPage({Key? key}) : super(key: key);

  @override
  _BuscarPageState createState() => _BuscarPageState();
}

class _BuscarPageState extends State {

  @override
  Widget build(BuildContext context) {
    final List<Rutas> linea = [
      Rutas("Línea 1", linea01),
      Rutas('Línea 2', linea02),
      Rutas('Línea 5', linea05),
      Rutas('Línea 8', linea08),
      Rutas('Línea 9', linea09),
      Rutas('Línea 10', linea10),
      Rutas('Línea 11', linea11),
      Rutas('Línea 16', linea16),
      Rutas('Línea 17', linea17),
      Rutas('Línea 18', linea18),
    ];

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            counter = 1;
            showSearch(
              context: context,
              delegate: SearchLineasDelegate(linea),
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

class SearchLineasDelegate extends SearchDelegate<Rutas> {
  final List<Rutas> linea;
  List<Rutas> _filter = [];
  SearchLineasDelegate(this.linea);

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
            lineaName = nombre;
            debugPrint('Linea Name: $lineaName');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TipoPage(lin: ruta, name: nombre)
              )
            );
          },
        );
      }
    );
  }
}