// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable, must_be_immutable, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_local_variable, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/pages/buscar_linea/select_dir_page.dart';
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
                builder: (context) => ShowLinea(lin: ruta, name: nombre)
              )
            );
          },
        );
      }
    );
  }
}