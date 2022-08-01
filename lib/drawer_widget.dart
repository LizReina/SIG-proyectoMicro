import 'package:flutter/material.dart';
import 'package:proyecto_bus/pages/esperando_bus/search_page.dart';
import 'package:proyecto_bus/pages/home_page.dart';
import 'package:proyecto_bus/pages/map_page.dart';
import 'package:proyecto_bus/pages/buscar_linea/buscar_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20,),
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/app_icon.png'),
                  fit: BoxFit.cover
                )
              ),
            )
          ),
          ListTile(
            title: const Text('Mapa',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            leading: const Icon(
              Icons.map,
              size: 20.0,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage()
              ));
            },
          ),
          ListTile(
            title: const Text('Buscar Linea',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            leading: const Icon(
              Icons.search,
              size: 20.0,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchList()
              ));
            },
          ),
          ListTile(
            title: const Text('Esperando micro',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            leading: const Icon(
              Icons.bus_alert,
              size: 20.0,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BuscarPage()
              ));
            },
          ),
          ListTile(
            title: const Text('Mostrar lineas',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            leading: const Icon(
              Icons.route,
              size: 20.0,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MapPage()
              ));
            },
          ), 
        ],
      ),
    );
  }
}