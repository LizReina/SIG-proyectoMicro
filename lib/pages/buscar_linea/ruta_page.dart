// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, library_private_types_in_public_api, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/drawer_widget.dart';
import 'package:proyecto_bus/global.dart';

class RutaPage extends StatefulWidget {
  LatLng inicio, fin;
  Set<Polyline> lin;

  RutaPage({
    Key? key, 
    required this.lin, 
    required this.inicio, 
    required this.fin
  }): super(key: key);

  @override
  _RutasPageState createState() => _RutasPageState();
}

class _RutasPageState extends State<RutaPage> {
  final Set<Marker> markers = Set();
  final _initialCameraPosition = const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void iniState() {
    super.initState();
  }

  Set<Marker> get getmarkers {
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId("inicio"),
        position: widget.inicio,
        infoWindow: const InfoWindow(
          title: 'Partida',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
      markers.add(Marker(
        markerId: const MarkerId("fin"),
        position: widget.fin,
        infoWindow: const InfoWindow(
          title: "Llegada",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    var rut = widget.lin;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: const MenuWidget(),
      body: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 28.0, right: 0.0, bottom: 0.0),
          child: Column(
            children: [
              Flexible(
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  polylines: rut,
                  markers: getmarkers,
                ),
              ),             
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Theme.of(context).primaryColorDark,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(                        
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).bottomAppBarColor,
                    size: 20,
                  ),
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 110, top: 40, right: 60, bottom: 650),
          child: Card(
            elevation: 10.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: tipo == "ambas" 
            ? Column(
              children: [
                ListTile(
                  title: Text(
                    widget.lin.first.polylineId.value.toString(),
                    style: const TextStyle(fontSize: 20,),
                  ),
                  leading: CircleAvatar(
                    backgroundColor:  widget.lin.first.color,
                  )
                ),
                ListTile(
                  title: Text(
                    widget.lin.last.polylineId.value.toString(),
                    style: const TextStyle(fontSize: 20,),
                  ),
                  leading: CircleAvatar(
                    backgroundColor:  widget.lin.last.color,
                  )
                ),
              ],
            )
            : ListTile(
              title: Text(
                widget.lin.first.polylineId.value.toString(),
                style: const TextStyle(fontSize: 20,),
              ),
              leading: CircleAvatar(
                backgroundColor: widget.lin.first.color,
              )
            )
          ),
        )
      ]
    ),
  );}
}