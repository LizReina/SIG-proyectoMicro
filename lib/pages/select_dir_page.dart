// ignore_for_file: sort_child_properties_last, must_be_immutable, prefer_typing_uninitialized_variables, library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/pages/ruta_page.dart';
import 'package:proyecto_bus/routes/lineas/rutas.dart';
import 'package:proyecto_bus/routes/points/linea01.dart';
import 'package:proyecto_bus/routes/points/linea02.dart';
import 'package:proyecto_bus/routes/points/linea05.dart';
import 'package:proyecto_bus/routes/points/linea08.dart';
import 'package:proyecto_bus/routes/points/linea09.dart';
import 'package:proyecto_bus/routes/points/linea10.dart';
import 'package:proyecto_bus/routes/points/linea11.dart';
import 'package:proyecto_bus/routes/points/linea16.dart';
import 'package:proyecto_bus/routes/points/linea17.dart';
import 'package:proyecto_bus/routes/points/linea18.dart';

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
      Rutas("Ruta de Ida", linea),
      Rutas("Ruta de Vuelta", linea),
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
          title: Text("Seleccione una ruta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: select.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                var polyline = select[index].polyline;
                if (select[index].name == 'Ruta de Ida') {
                  Set<Polyline> polyIda = {Polyline(
                    polylineId: polyline.first.polylineId,
                    color: polyline.first.color,
                    points: polyline.first.points,
                    width: polyline.first.width
                  )};
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RutaPage(
                      lin: polyIda,
                      inicio: polyIda.first.points.first,
                      fin: polyIda.first.points.last,
                    )
                  ));
                } else if (select[index].name == 'Ruta de Vuelta') {
                  Set<Polyline> polyVuelta = {Polyline(
                    polylineId: polyline.last.polylineId,
                    color: polyline.last.color,
                    points: polyline.last.points,
                    width: polyline.last.width
                  )};
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RutaPage(
                      lin: polyVuelta,
                      inicio: polyVuelta.first.points.first,
                      fin: polyVuelta.first.points.last,
                    )
                  ));
                }
              },
              child: Container(
                child: Text(
                  select[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22
                  ),
                ),
                color: Colors.green,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
