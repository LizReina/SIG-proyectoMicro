import 'package:flutter/material.dart';
import 'package:proyecto_bus/models/linea_model.dart';
import 'package:textfield_search/textfield_search.dart';

class ShowLineaPage extends StatefulWidget {
  const ShowLineaPage({Key? key}) : super(key: key);

  @override
  State<ShowLineaPage> createState() => _ShowLineaPageState();
}

class _ShowLineaPageState extends State<ShowLineaPage> {
  String label = "Hacer vista de buscar lineas";
  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    // ignore: avoid_print
    print("text field: ${myController.text}");
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: TextFieldSearch(
              initialList: lineasItems, 
              label: label, 
              controller: myController
            ),
          ),
        ),
      ),
    );
  }
}
