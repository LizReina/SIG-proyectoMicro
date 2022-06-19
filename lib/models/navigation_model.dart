import 'package:flutter/material.dart';

class NavigationModel {
  NavigationModel({
    required this.title,
    required this.icon,
  });

  String title;
  IconData icon;
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Mapa", icon: Icons.map),
  NavigationModel(title: "Líneas", icon: Icons.bus_alert),
  NavigationModel(title: "Buscar", icon: Icons.search),
];