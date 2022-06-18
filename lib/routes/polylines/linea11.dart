import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../points/linea11.dart';

final Set<Polyline> linea11 = {
  Polyline(
    points: linea11I,
    polylineId: const PolylineId('L10I'),
    width: 2,
    color: const Color.fromARGB(255, 29, 213, 173),
  ),
  Polyline(
    points: linea11V,
    polylineId: const PolylineId('L10V'),
    width: 2,
    color: const Color.fromARGB(255, 236, 215, 55),
  ),
};
