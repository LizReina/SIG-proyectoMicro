import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_bus/controllers/home_controller.dart';
import 'package:proyecto_bus/pages/ver_lineas_page.dart';
import 'package:proyecto_bus/widgets/collapsing_navigation_drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Scaffold(  
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
                                  Set<Marker> markers = {
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
                                  };
                                  Navigator.push(context,MaterialPageRoute(
                                    //AGREGAR MARKERS DE PARTIDA Y LLEGADA
                                    builder: (context) => RutaPage(lin: polyline, markers: markers,)
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
            const CollapsingNavigationDrawer(),
          ] 
        ),
      )
    );
  }
}
