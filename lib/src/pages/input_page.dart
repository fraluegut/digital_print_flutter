import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

import 'package:fluttertoast/fluttertoast.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";

  String _opcionSeleccionada = "Volar";

  List _poderes = ["Volar", "Rayos X", "Super Aliento", "Super"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo registro"),
      ),
      body: PageView(
        children: <Widget>[_localizacion(), _identificacion(), _restauracion(context)],
      ),
    );
  }
}

Widget _crearInputGeneral(String texto) {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
  );
}

Widget _localizacion() {
  return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      children: <Widget>[
        _crearCabecera(),
        Divider(
          thickness: 6.0,
        ),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          Flexible(
              flex: 1, child: _crearInputGeneral("Cuadro"), fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: _crearInputGeneral("Nivel estr."),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1, child: _crearInputGeneral("UU.EE."), fit: FlexFit.tight)
        ])),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text("Localización",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  _crearInputGeneral("X"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Y"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Zs"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Zi")
                ],
              ),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  _crearInputGeneral("String texto"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Rot. X"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Rot. Y"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Rot. Z")
                ],
              ),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: 22.5),
                  Text("Dimensiones"),
                  SizedBox(height: 25.0),
                  _crearInputGeneral("Largo"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Ancho"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Espesor")
                ],
              ),
              fit: FlexFit.tight)
        ])),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      ]);
}

Widget _identificacion() {
  return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      children: <Widget>[
        _crearCabecera(),
        Divider(
          thickness: 6.0,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text("Identificación",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          Flexible(
              flex: 1,
              child: Column(children: [
                _crearInputGeneral("Material"),
                SizedBox(height: 5.0),
                _crearInputGeneral("Elemento"),
                SizedBox(height: 5.0),
                _crearInputGeneral("Observaciones"),
                SizedBox(height: 5.0)
              ]),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  _crearInputGeneral("Talla"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Género"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Familia"),
                  SizedBox(height: 5.0),
                  _crearInputGeneral("Especie")
                ],
              ),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
        ])),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      ]);
}

Widget _restauracion(context) {
  return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      children: <Widget>[
        _crearCabecera(),
        Divider(
          thickness: 6.0,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text("Restauración",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          Flexible(
              flex: 1,
              child: Column(children: [
                _crearInputGeneral("Estado"),
                SizedBox(height: 5.0),
                _crearInputGeneral("Consolidación"),
                SizedBox(height: 5.0),
                _crearInputGeneral("Extracción"),
                SizedBox(height: 5.0)
              ]),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  _crearInputGeneral("Observaciones"),
                  SizedBox(height: 35.0),
                  FloatingActionButton(
                      child: Icon(Icons.photo_camera),
                      onPressed: () {
                        print("Hola");
                        _makeGetRequest() async {
                          // make GET request
                          String url =
                              'https://jsonplaceholder.typicode.com/posts/1';
                          Response response = await get(url);
                          // sample info available in response
                          int statusCode = response.statusCode;
                          Map<String, String> headers = response.headers;
                          String contentType = headers['content-type'];
                          String json = response.body;
                          print(statusCode);
                          print(json);

                          // TODO convert json to object...
                        }

                        ;
                        print(_makeGetRequest());
                        print("Hola2");
                        _makePostRequest() async {
                          // set up POST request arguments
                          String url = 'http://185.254.206.143:5001/tasks';
                          Map<String, String> headers = {
                            "Content-type": "application/json"
                          };
                          String json =
                              '{"title": "Hello", "description": "from Flutter"}';
                          // make POST request
                          Response response =
                              await post(url, headers: headers, body: json);
                          // check the status code for the result
                          int statusCode = response.statusCode;
                          // this API passes back the id of the new item added to the body
                          String body = response.body;
                          print("Send");
                          // {
                          //   "title": "Hello",
                          //   "body": "body text",
                          //   "userId": 1,
                          //   "id": 101
                          // }
                        }

                        ;print(_makePostRequest())

                        ;
                      })
                ],
              ),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
        ])),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          Flexible(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                        child: Icon(Icons.delete_forever, size: 40.0),
                        onPressed: () {}),
                    SizedBox(height: 5.0),
                    FloatingActionButton(
                        child: Icon(Icons.print, size: 35.0), onPressed: () {}),
                    SizedBox(height: 5.0),
                    FloatingActionButton(
                        child: Icon(Icons.send, size: 35.0), onPressed: () {
                        
                        })
                  ]),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
        ])),
      ]);
}

Widget _crearCabecera() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Baza-1 (Baza, Granada)"),
                    SizedBox(width: 40.0),
                    Text(formattedDate),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("Excavador: Francisco Javier Luengo"),
              ],
            ),
          ),
        ],
      ));

  Widget _gethttp1() {
    _makeGetRequest() async {
      // make GET request
      String url = 'https://jsonplaceholder.typicode.com/posts';
      Response response = await get(url);
      // sample info available in response
      int statusCode = response.statusCode;
      print(statusCode);
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      String json = response.body;
      // TODO convert json to object...
    }

    ;
  }

  
}
