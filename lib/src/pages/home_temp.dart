import 'package:digital_print/src/pages/alert_page.dart';
import 'package:digital_print/src/pages/compass.dart';
import 'package:digital_print/src/pages/consultar_registro.dart';
import 'package:digital_print/src/pages/editar_registro.dart';
import 'package:digital_print/src/pages/get_page.dart';
import 'package:digital_print/src/pages/gethttp.dart';
import 'package:digital_print/src/pages/input_page.dart';
import 'package:digital_print/src/pages/internet.dart';

import 'package:digital_print/src/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipo1(context),
          SizedBox(height: 30.0),
          _cardTipo3(context),
          SizedBox(height: 30.0),
          _cardTipo4(context),
          SizedBox(height: 30.0),
          
        ],
      ),
    );
  }


  Widget _cardTipo1(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.add, color: Colors.blue, size: 50.0),
              title: Text("Nuevo Registro"),
              subtitle: Text(
                  "Accede aquí para crear un nuevo registro"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Información"),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("Entrar"),
                  onPressed: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputPage(),
                            ));
                  },
                )
              ],
            )
          ],
        ));
  }

  
  
  Widget _cardTipo3(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.search, color: Colors.blue, size: 50.0),
              title: Text("Registros"),
              subtitle: Text(
                  "Accede aquí para consultar, editar, eliminar o imprimir un registro"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Información"),
                  onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AlertPage(),
              ));},
                ),
                FlatButton(
                  child: Text("Entrar"),
                  onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StarWarsData(),
              ));},
                )
              ],
            )
          ],
        ));
  }
  
  Widget _cardTipo4(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue, size: 50.0),
              title: Text("Configurar Proyecto"),
              subtitle: Text(
                  "Accede aquí para configurar el proyecto"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Información"),
                  onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Compass(),
                            ));},
                ),
                FlatButton(
                  child: Text("Entrar"),
                  onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                            ));},
                )
              ],
            )
          ],
        ));
  }

}
