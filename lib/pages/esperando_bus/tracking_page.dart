// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/drawer_widget.dart';

class TrackingPage extends StatefulWidget {
  LatLng inicio, fin;
  Set<Polyline> lin;

  TrackingPage({
    Key? key, 
    required this.lin, 
    required this.inicio, 
    required this.fin
  }): super(key: key);

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final Set<Marker> markers = {};
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
          padding: const EdgeInsets.all(0),
          child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Flexible(
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  myLocationButtonEnabled: true,
                  polylines: rut,
                  markers: getmarkers,
                ),
              );
            }
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
          padding: const EdgeInsets.only(left: 100, top: 20, right: 20),
          child: Card(
            elevation: 10.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                widget.lin.first.polylineId.value.toString(),
                style: const TextStyle(fontSize: 20,),
              ),
              leading: CircleAvatar(
                backgroundColor:  widget.lin.first.color,
              )
            )
          ),
        )
      ]
    ),
  );}
}