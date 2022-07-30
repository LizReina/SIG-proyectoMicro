// ignore_for_file: library_private_types_in_public_api, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/pages/buscar_linea/ruta_page.dart';
import 'package:proyecto_bus/pages/esperando_bus/tracking_page.dart';
import 'package:proyecto_bus/routes/lineas/rutas.dart';

class TipoPage extends StatefulWidget {
  String name;
  var lin;

  TipoPage({Key? key, required this.lin, required this.name}): super(key: key);

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends State<TipoPage> {
  @override
  Widget build(BuildContext context) {
    var linea = widget.lin;

    final List<Rutas> select = [
      Rutas("Ruta de Ida", linea),
      Rutas("Ruta de Vuelta", linea),
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
                  tipo = 'ida';
                  debugPrint('Tipo: $tipo');
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
                  tipo = 'vuelta';
                  debugPrint('Tipo: $tipo');
                  Set<Polyline> polyVuelta = {Polyline(
                    polylineId: polyline.last.polylineId,
                    color: polyline.last.color,
                    points: polyline.last.points,
                    width: polyline.last.width
                  )};
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TrackingPage(
                      lin: polyVuelta,
                      inicio: polyVuelta.first.points.first,
                      fin: polyVuelta.first.points.last,
                    )
                  ));
                }
              },
              child: Container(
                color: Colors.green,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text(
                  select[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
