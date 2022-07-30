import 'package:flutter/material.dart';
import 'package:proyecto_bus/pages/home_page.dart';
import 'package:proyecto_bus/pages/buscar_linea/buscar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Pasajero',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/lineas': (context) => const SearchList(),
      },
    );
  }
}
