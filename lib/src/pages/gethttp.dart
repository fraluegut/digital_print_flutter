import 'package:flutter/material.dart';
import 'package:digital_print/src/models/elemento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'menu_provider.dart';

import 'package:flutter/services.dart' show rootBundle;

class Registros extends StatelessWidget {
  

  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[for (var item in list) Text("ey")],
      ),
    );
  }

  var list = ["one", "two", "three", "four"];

  Widget getTextWidgets(List<dynamic> strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < strings.length; i++) {
      list.add(new Text("Hola"));
    }
    return new Row(children: list);
  }



  _getregistros() {
    List<dynamic> registros = [];

    _ConsultaRegistros() {
      Future<List<dynamic>> cargarData() async {
        String url = 'http://192.168.1.116:5000/registrobaza';
        Response response = await get(url);
        // sample info available in response
        int statusCode = response.statusCode;
        print(url);
        Map<String, String> headers = response.headers;
        String contentType = headers['content-type'];
        String json1 = response.body;
        rootBundle.loadString(json1).then((data) {
          List<dynamic> registros = jsonDecode(json1);

          return registros;
        });
      }
    }
  }

}
