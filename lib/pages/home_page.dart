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
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 200,
                      width: 200,
                      child: ListView.builder(
                        itemCount: controller.listpoly.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  controller.listpoly[index].polylineId.toString(),
                                  style: const TextStyle(fontSize: 20,),
                                ),
                                leading: CircleAvatar(
                                  child: Container(
                                    color: controller.listpoly[index].color,
                                  )
                                )
                              )
                            )
                          );
                        }
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
