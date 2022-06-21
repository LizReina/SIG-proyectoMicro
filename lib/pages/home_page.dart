import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_bus/controllers/home_controller.dart';
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
                          initialCameraPosition: controller.initialCameraPosition,
                          myLocationButtonEnabled: true,
                          onTap: controller.onTap,
                      ),
                    ),                    
                    SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        child: controller.listpoly.isEmpty
                        ? const SizedBox(width: 2, height: 2,)
                        : Column(
                            children: controller.listpoly.map((poly) {
                              return GestureDetector(
                                onTap: () {},
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
