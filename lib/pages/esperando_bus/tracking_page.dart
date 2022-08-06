// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_bus/asset.dart';
import 'package:proyecto_bus/drawer_widget.dart';
import 'package:proyecto_bus/models/api_response.dart';
import 'package:proyecto_bus/models/recorrido_model.dart';
import 'package:proyecto_bus/services/recorrido_controller.dart';

class TrackingPage extends StatefulWidget {
  LatLng inicio, fin;
  Set<Polyline> lin;

  TrackingPage(
      {Key? key, required this.lin, required this.inicio, required this.fin})
      : super(key: key);

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final Set<Marker> markers = {};
  final _initialCameraPosition = const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Position currentLocation;
  List<dynamic> _postBus = [];

  /*Future<Set<Marker>> get getmarkers async {
    setState(() {
      //markers.clear();
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
    ApiResponse response = await getBusToday();
    _postBus = response.data as List<dynamic>;
    // ignore: unused_local_variable
      /*final icon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size.fromHeight(2)), 'assets/images/bus.png');*/
    for (int i = 0; i < _postBus.length; i++) {
      Bus bus = _postBus[i];
      markers.add(
        Marker(
          markerId: MarkerId(bus.interno.toString()),
          position: LatLng(
            double.parse(bus.latitud.toString()),
            double.parse(bus.longitud.toString())
          ),
          infoWindow: InfoWindow(
            title: 'Interno: ${bus.interno}',
          ),
          //icon: icon
        )
      );
    }
    debugPrint('MARKERS: $markers');
    return markers;
  }*/

  Future<Set<Marker>> get getmarkers async {
    ApiResponse response = await getBusToday();
    setState(() async {
      debugPrint('RESPONSE: ${response.data}');
      _postBus = response.data as List<dynamic>;

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

      // ignore: unused_local_variable
      final icon =
          BitmapDescriptor.fromBytes(await assetToBytes('assets/images/bus.png'));

      for (int i = 0; i < _postBus.length; i++) {
        Bus bus = _postBus[i];
        markers.add(Marker(
            markerId: MarkerId(bus.interno.toString()),
            position: LatLng(double.parse(bus.latitud.toString()),
                double.parse(bus.longitud.toString())),
            infoWindow: InfoWindow(
              title: 'Interno: ${bus.interno}',
            ),
            icon: icon));
      }
    });
    return markers;
  }

  Stream<Set<Marker>> coordsStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      Set<Marker> someCoords = getmarkers as Set<Marker>;
      yield someCoords;
    }
  }

  @override
  void initState() {
    getmarkers;
    super.initState();
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
          child: StreamBuilder<Object>(
            stream: coordsStream(),
            builder: (context, snapshot) {
              return GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                polylines: rut,
                markers: markers,
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
          padding: const EdgeInsets.only(left: 110, top: 40, right: 60, bottom: 650),
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
                backgroundColor: widget.lin.first.color,
              )
            )
          ),
        )
      ]),
    );
  }
}
