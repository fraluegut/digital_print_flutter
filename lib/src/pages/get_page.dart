

import 'package:digital_print/src/models/elemento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:convert';
// Variables

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

// MAIN CLASS
class GetPage extends StatefulWidget {
  @override
  _GetPageState createState() => _GetPageState();
}

Elemento elemento = new Elemento();
final int valor = 0;
final formKey = GlobalKey<FormState>();
final myController = TextEditingController();

class _GetPageState extends State<GetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consulta de registros"),
        ),
        body: SingleChildScrollView(
            // <-- wrap this around
            child: Column(
          children: <Widget>[
            Text("HOLA"),

            Divider(thickness: 6.0),
            SizedBox(height: 10.0),
            FloatingActionButton(
              heroTag: "botonpost",
              child: Icon(Icons.send, size: 35.0),
              onPressed: (){Future<List<dynamic>> cargarData() async {
      };
    }
    ),
            
  ], )));
  }
}

// MAKE GET REQUEST
/*
Widget _gethttp1() {
    _makeGetRequest() async {
      // make GET request
      String url = 'http://192.168.1.116:5000/registrobaza';
      Response response = await get(url);
      // sample info available in response
      int statusCode = response.statusCode;
      print(url);
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String json = response.body;
      // TODO convert json to object...
    }

    ;
  }
*/
