import 'package:digital_print/src/models/elemento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _ConsultaRegistros {
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

final consultaRegistros = new _ConsultaRegistros();
