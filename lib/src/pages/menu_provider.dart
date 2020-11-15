import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart';
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    String url = 'http://192.168.1.116:5000/registrobaza';
    Response response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    print(url);
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json1 = response.body;
    final resp = await rootBundle.loadString(json1);
    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap["id"];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
