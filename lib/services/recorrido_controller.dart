import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_bus/global.dart';
import 'package:proyecto_bus/models/api_response.dart';
import 'package:proyecto_bus/models/recorrido_model.dart';

  Future<ApiResponse> getBusToday() async {
    ApiResponse apiResponse = ApiResponse();
    //try{
      var url = '${baseUrl}coordinates/$lineaName/$tipo';
      debugPrint('URL: $url');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      debugPrint('BODY: ${response.body}');

      //switch (response.statusCode) {
        //case 200:
          apiResponse.data = jsonDecode(response.body)['bus'].map((p) => Bus.fromJson(p)).toList();
          apiResponse.data as List<dynamic>;
          //break;
        /*case 401:
          apiResponse.error = unauthorized;
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }*/
    //}
    //catch (e) {
      //apiResponse.error = serverError;
    //}
    debugPrint('APIRESPONSE: ${apiResponse.data}');
    return apiResponse;
  }

 