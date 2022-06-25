import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_bus/controllers/home_controller.dart';
import 'package:proyecto_bus/widgets/collapsing_navigation_drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
/*<<<<<<< brayan
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(-17.78629, -63.18117), zoom: 13);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Flexible(
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  myLocationButtonEnabled: true,
                  polylines: rutas,
                ),
=======*/
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Scaffold(  
        body: Stack(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Flexible(
                    child: Consumer<HomeController>(
                      builder: (_, controller, __) => GoogleMap(
                        circles: controller.circles,
                        polylines: controller.polylines,
                        initialCameraPosition: controller.initialCameraPosition,
                        myLocationButtonEnabled: true,
                        //polylines: rutas,
                        onTap: controller.onTap,
                      ),
                    )
                  ),
                ],
//>>>>>>> apkprueba
              ),
            ),
            const CollapsingNavigationDrawer(),
          ] 
        ),
      )
    );
  }
}
