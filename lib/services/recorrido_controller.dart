// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/models/api_response.dart';
import 'package:proyecto_bus/models/recorrido_model.dart';

  Future<ApiResponse> getBusToday() async {
    ApiResponse apiResponse = ApiResponse();
    try{
      var url = '${baseUrl}showbuses/$lineaName/$tipo';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
      );

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['bus'].map((p) => Bus.fromJson(p)).toList();
          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = unauthorized;
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch (e) {
      apiResponse.error = serverError;
    }
    
    return apiResponse;
  }

  getPublicData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  /*class TrackingService{
    static final String _url = '${baseUrl}showbuses/$lineaName/$tipo';

    static Future browse() async {
      http.Response response = await http.get(Uri.parse(_url));

      String content = response.body;
      List collection = json.decode(content);
      List
    }
  }*/

 