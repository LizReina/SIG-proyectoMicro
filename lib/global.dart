import 'package:flutter/material.dart';

//const baseUrl = "http://10.0.2.2:8000/api/";
//const baseUrl = 'https://mainbusesgi.herokuapp.com/api/';
//const baseUrl = "http://127.0.0.1:8000/api/";
const baseUrl = "http://ec2-3-87-66-87.compute-1.amazonaws.com/api/";

const Map<String, String> headers = {"Content-Type": "application/json"};

const serverError = 'Server Error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Somethin went wrong, try again';

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

int counter = 0;
String lineaName = "";
String tipo = "";