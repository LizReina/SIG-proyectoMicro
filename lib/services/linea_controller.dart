import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/models/line_model.dart';
import 'package:proyecto_bus/models/ruta_model.dart';
import 'package:http/http.dart' as http;

class LineaController {
  Future<List<Ruta>>? getLineas() async {
    // ignore: prefer_const_declarations
    final url = '${baseUrl}lineas/1';
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      final rutasResponse = lineaFromMap(response.body);
      return rutasResponse.rutas;
    }
    return [];
  }
}