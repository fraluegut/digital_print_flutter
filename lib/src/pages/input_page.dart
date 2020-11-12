import 'package:digital_print/src/models/elemento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

import 'package:barcode_scan/barcode_scan.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Elemento elemento = new Elemento();

final formKey = GlobalKey<FormState>();
final String _cuadro = "";

class _InputPageState extends State<InputPage> {
  // Valores de localización:
  String _cuadro = "";
  String _nivel_Estrat = "";
  int _uuee = 0;

  int _localizacion_X = 1;
  int _localizacion_Y = 0;
  int _localizacion_Zs = 0;
  int _localizacion_Zi = 0;

  int _localizacion_RotX = 0;
  int _localizacion_RotY = 0;
  int _localizacion_RotZ = 0;

  int _localizacion_Largo = 0;
  int _localizacion_Ancho = 0;
  int _localizacion_Espesor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo registro"),
      ),
      body: PageView(
        children: <Widget>[
          _localizacion(),
          _identificacion(),
          _restauracion(context)
        ],
      ),
    );
  }
}

// Widgets generales

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
                Text("Excavador: Fulanito y Menganito"),
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

Widget _localizacion() {
  return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      children: <Widget>[
        _crearCabecera(),
        Divider(thickness: 6.0),
        _cuadro_nivel_uuee(),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text("Localización",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        IntrinsicHeight(child: _localizacion_data()),
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

Widget _localizacion_data() {
  return Row(children: <Widget>[
    Flexible(
        flex: 1,
        child: Container(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _crearInput("X", TextInputType.number, elemento.locationX),
                    SizedBox(height: 5.0),
                    _crearInput("Y", TextInputType.number, elemento.locationY),
                    SizedBox(height: 5.0),
                    _crearInput(
                        "Zs", TextInputType.number, elemento.locationZs),
                    SizedBox(height: 5.0),
                    _crearInput(
                        "Zi", TextInputType.number, elemento.locationZi),
                  ],
                ))),
        fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(
        flex: 1,
        child: Column(
          children: [
            _coordAprox(),
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
                        print(elemento.locationX);
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
                        child: Icon(Icons.print, size: 35.0),
                        onPressed: _scanQR),
                    SizedBox(height: 5.0),
                    FloatingActionButton(
                      child: Icon(Icons.send, size: 35.0),
                      onPressed: _makePostRequest,
                    ),
                  ]),
              fit: FlexFit.tight),
          SizedBox(width: 10.0),
        ])),
      ]);
}

// Widgets Botones
Widget _crearInputGeneral(
  String texto,
) {
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

Widget _crearInput(String texto, TextInputType tipo, int valor) {
  return TextFormField(
    initialValue: valor.toString(),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => valor = int.parse(value),
    validator: (value) {
      if (int.parse(value) > 100) {
        return "El valor no puede ser mayor a 100";
      } else {
        return null;
      }
    },
  );
}

Widget _cuadro_nivel_uuee() {
  return IntrinsicHeight(
      child: Row(children: <Widget>[
    Flexible(flex: 1, child: _crearInputGeneral("Cuadro"), fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(
        flex: 1, child: _crearInputGeneral("Nivel estr."), fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(flex: 1, child: _crearInputGeneral("UU.EE."), fit: FlexFit.tight)
  ]));
}

Widget _crearLocalizacion_X() {
  return TextFormField(
    keyboardType: TextInputType.number,    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: "Xs",
      labelText: "Xs",
      //helperText: texto,
    ),
  );
}

Widget _coordAprox() {
  bool checkedValue = false;
  return CheckboxListTile(
    title: Text(
      "Coord. Aprox.",
      style: TextStyle(fontSize: 10.0),
    ),
    value: checkedValue,
    onChanged: (newValue) {},
    controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
  );
}

_scanQR() async {
  String futureString = "";

  try {
    futureString = await BarcodeScanner.scan();
  } catch (e) {
    futureString = e.toString();
  }

  print("Future String: $futureString");

  if (futureString != null) {
    print("Tenemos información");
  }
}

void _submit() {
  //formKey.currentState.validate();
  //formKey.currentState.save();
  print(elemento.locationX);
}

_makePostRequest() async {
  // set up POST request arguments 'http://185.254.206.143:5001/registrobaza';
  String url = 'http://192.168.1.116:5000/registrobaza';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json =
      '{"ancho": 3, "consolidacion": "3","coord_aprox": 3,"cuadro": "3", "elemento": "3","especie": "3", "espesor": 3, "estado": "3",  "excavador": "3",    "extraccion": 3,    "familia": "3",    "foto": 3,    "genero": "3","largo": 3,    "localizacionX": 3,    "localizacionY": 3,    "localizacionZi": 3,    "localizacionZs": 3,    "material": "3",    "nivel": "3",    "observaciones_identificacion": "3",    "observaciones_restauracion": "3",    "registro": "2020-11-12T16:45:43",    "rotX": 3,    "rotY": 3,    "rotZ": 3,    "talla": "3",    "uuee": "3"}';
  //'{"excavador": "javi", "cuadro": "A2","nivel": "2","uuee": "2","localizacionX": 2,"localizacionY": 2,"localizacionZs": 2,"localizacionZi": 2,"largo": 2,"ancho": 2,"espesor": 2,"material": "prueba2"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);

  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  print("Send");
  print(response); //print(elemento.locationX);
}

/*
_makePostRequest() async {
  // set up POST request arguments
  String url = 'http://185.254.206.143:5001/tasks';
  Map<String, String> headers = {
    "Content-type": "application/json"
  };
  String json = 
      '{"title": $elemento.locationX, "description": "from Flutter"}';
  // make POST request
  Response response =
      await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  print("Send");
  print(elemento.locationX);
 
  }
  */
