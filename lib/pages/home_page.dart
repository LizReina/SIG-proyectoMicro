import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_bus/controllers/home_controller.dart';
import 'package:proyecto_bus/pages/ruta_page.dart';
import 'package:proyecto_bus/widgets/drawer_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Scaffold(  
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: const MenuWidget(),
        body: Stack(
          children: <Widget> [          
            Padding(
              padding: const EdgeInsets.all(0),
              child: Consumer<HomeController>(
                builder: (_, controller, __) => Column(
                  children: [
                    Flexible(
                      child: GoogleMap(
                          circles: controller.circles,
                          polylines: controller.polylines,
                          markers: controller.markers,
                          initialCameraPosition: controller.initialCameraPosition,
                          myLocationButtonEnabled: true,
                          onTap: controller.onTap,
                      ),
                    ), 
                    (controller.listpoly.isEmpty) 
                    ? const SizedBox(width: 2, height: 2,)                  
                    : SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        child: controller.listpoly.isEmpty
                        ? const SizedBox(width: 2, height: 2,)
                        : Column(
                            children: controller.listpoly.map((poly) {
                              return GestureDetector(
                                onTap: () {
                                  Set<Polyline> polyline = {poly};
                                  LatLng inicio = LatLng(poly.points.first.latitude, poly.points.first.longitude);
                                  LatLng fin = LatLng(poly.points.last.latitude, poly.points.last.longitude);
                                  /*Set<Marker> markers = {
                                    Marker(
                                      markerId: const MarkerId('Partida'),
                                      position: poly.points.first,
                                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                                      infoWindow: const InfoWindow(title: 'Partida'),
                                    ),
                                    Marker(
                                      markerId: const MarkerId('Llegada'),
                                      position: poly.points.last,
                                      infoWindow: const InfoWindow(title: 'Llegada'),
                                    )
                                  };*/
                                  Navigator.push(context,MaterialPageRoute(
                                    builder: (context) => RutaPage(lin: polyline, inicio: inicio, fin: fin,)
                                  ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  height: 70,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        poly.polylineId.value.toString(),
                                        style: const TextStyle(fontSize: 20,),
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: poly.color,
                                      )
                                    )
                                  )
                                )
                              );
                            }).toList(),
                          )
                      ),
                    )
                  ],
                ),
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
            //const CollapsingNavigationDrawer(),
          ] 
        ),
      )
    );
  }
}
