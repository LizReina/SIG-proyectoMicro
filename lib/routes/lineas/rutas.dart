import 'package:google_maps_controller/google_maps_controller.dart';

class Rutas {
  late final String name;
  // ignore: non_constant_identifier_names
  Set<Polyline> polyline;

  Rutas(this.name, this.polyline);
}

class ida {
  late String name;
  late List ini;
  //late Set<Polyline> ini={Polyline(points: )};
  ida(this.name, this.ini);
}

class vuelta {
  late String name;
  late List fin;
  vuelta(this.name, this.fin);
}

class lista {
  late LatLng ini;
}
