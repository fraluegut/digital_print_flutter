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
final int valor = 0;
final formKey = GlobalKey<FormState>();

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuevo registro"),
        ),
        body: SingleChildScrollView(
            // <-- wrap this around
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text("Hola"),
                    _crearInputNivel("Talla", TextInputType.text),
                    //_crearCabecera(),
                    Divider(thickness: 6.0),
                    SizedBox(height: 10.0),
                    //_cuadro_nivel_uuee(),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    //_localizacion_data(),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    //_identificacion(),
                    Divider(thickness: 6.0),
                    //_restauracion(context),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    SizedBox(height: 500.0),
                  ],
                ))));
  }
}

// Widgets generales

/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)

/// This is the stateful widget that the main application instantiates.
class DropBoxWidget extends StatefulWidget {
  DropBoxWidget({Key key}) : super(key: key);

  @override
  _DropBoxWidgetState createState() => _DropBoxWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropBoxWidgetState extends State<DropBoxWidget> {
  String dropdownValue = 'I';
  List<String> lista1 = ["I", "J", "K", "L", "M1", "N", "O", "P", "Q", "R"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), border: Border.all()),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: lista1.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
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
                Text("Excavador: Fulanito y Menganito"),
              ],
            ),
          ),
        ],
      ));
}

String elegido = "ancho";
String procesado = "int.parse(value)";
Widget _crearInputGeneral(
    String texto, TextInputType tipo, String elegido, String procesado) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elegido = elegido,
  );
}

/*
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
        //_cuadro_nivel_uuee(),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Text("Datos Generales",
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        IntrinsicHeight(child: _localizacion_data()),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      ]);
}
*/
/*
Widget _identificacion() {
  return Column(children: <Widget>[
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
            _crearInputGeneral("Material", TextInputType.text, elegido ="elemento.ancho", procesado = "value"),
            SizedBox(height: 5.0),
            //_crearInputGeneral("Elemento", TextInputType.text),
            SizedBox(height: 5.0),
            //_crearInputGeneral("Observaciones", TextInputType.text),
            SizedBox(height: 5.0)
          ]),
          fit: FlexFit.tight),
      SizedBox(width: 10.0),
      Flexible(
          flex: 1,
          child: Column(
            children: [
              _crearInputGeneral("Talla", TextInputType.text),
              SizedBox(height: 5.0),
              _crearInputGeneral("Género", TextInputType.text),
              SizedBox(height: 5.0),
              _crearInputGeneral("Familia", TextInputType.text),
              SizedBox(height: 5.0),
              _crearInputGeneral("Especie", TextInputType.text),
            ],
          ),
          fit: FlexFit.tight),
      SizedBox(width: 10.0),
    ])),
    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
  ]);
}
*/
/*
Widget _localizacion_data() {
  return Column(children: [
    Text("Localización",
        style: TextStyle(color: Colors.grey, fontSize: 15),
        textAlign: TextAlign.left),
    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
      Flexible(
          flex: 1,
          child: Container(
              child: Column(
            children: [
              _crearInputGeneral("X", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Y", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Zs", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Zi", TextInputType.number),
            ],
          ))),
      SizedBox(width: 10.0),
      Flexible(
          flex: 1,
          child: Column(
            children: [
              _crearInputGeneral("Coord.Aprox", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Rot X", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Rot Y", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Rot Z", TextInputType.number),
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
              _crearInputGeneral("Largo", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Ancho", TextInputType.number),
              SizedBox(height: 5.0),
              _crearInputGeneral("Espesor", TextInputType.number),
            ],
          ),
          fit: FlexFit.tight)
    ]),
  ]);
}
*/
Widget _restauracion(context) {
  return Column(children: <Widget>[
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
            //_crearInputGeneral("Estado", TextInputType.text),
            SizedBox(height: 5.0),
            //_crearInputGeneral("Consolidacion", TextInputType.text),
            SizedBox(height: 5.0),
            //_crearInputGeneral("Extracción", TextInputType.text),
            SizedBox(height: 5.0)
          ]),
          fit: FlexFit.tight),
      SizedBox(width: 10.0),
      Flexible(
          flex: 1,
          child: Column(
            children: [
              //_crearInputGeneral("Observaciones", TextInputType.text),
              SizedBox(height: 35.0),
              FloatingActionButton(
                  child: Icon(Icons.photo_camera),
                  onPressed: () {
                    print("Hola");
                    print(elemento.localizacionX);
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FloatingActionButton(
                child: Icon(Icons.delete_forever, size: 40.0),
                onPressed: () {}),
            SizedBox(height: 5.0),
            FloatingActionButton(
                child: Icon(Icons.print, size: 35.0),
                onPressed: () {}), //_scanQR),
            SizedBox(height: 5.0),
            FloatingActionButton(
                child: Icon(Icons.send, size: 35.0),
                onPressed: () {} //_makePostRequest,
                ),
          ]),
          fit: FlexFit.tight),
      SizedBox(width: 10.0),
    ])),
  ]);
}

/*



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
  print(elemento.localizacionX);
}

_makePostRequest() async {
  formKey.currentState.validate();
  formKey.currentState.save();
  // set up POST request arguments 'http://185.254.206.143:5001/registrobaza';
  String url = 'http://192.168.1.116:5000/registrobaza';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json =
      '{"ancho": ${elemento.ancho}, "consolidacion": ${elemento.consolidacion},"coord_aprox": 1,"cuadro": ${elemento.cuadro}, "elemento": ${elemento.elemento},"especie": ${elemento.especie}, "espesor": ${elemento.espesor}, "estado": ${elemento.estado},  "excavador": ${elemento.excavador},    "extraccion": 0,    "familia": ${elemento.familia},    "foto": 0,    "genero": ${elemento.genero},"largo": ${elemento.largo},    "localizacionX": ${elemento.localizacionX},    "localizacionY": ${elemento.localizacionY},    "localizacionZi": ${elemento.localizacionZi},    "localizacionZs": ${elemento.localizacionZs},    "material": "${elemento.material}",    "nivel": ${elemento.nivel},    "observaciones_identificacion": ${elemento.observacionesIdentificacion},    "observaciones_restauracion": ${elemento.observacionesRestauracion},   "rotX": ${elemento.rotX},    "rotY": ${elemento.rotY},    "rotZ": ${elemento.rotZ},    "talla": ${elemento.talla},    "uuee": ${elemento.uuee}}';
  //'{"excavador": "javi", "cuadro": "A2","nivel": "2","uuee": "2","localizacionX": 2,"localizacionY": 2,"localizacionZs": 2,"localizacionZi": 2,"largo": 2,"ancho": 2,"espesor": 2,"material": "prueba2"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);

  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  print("Send");
  print(response.body);
  print(json);
  print(response.statusCode); //print(elemento.locationX);
}
*/
/*
Widget _cuadro_nivel_uuee() {
  return IntrinsicHeight(
      child: Row(children: <Widget>[
    Flexible(
        flex: 1,
        child: _crearInputGeneral("Cuadro", TextInputType.text),
        fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(
        flex: 1,
        child: _crearInputGeneral("Nivel estr.", TextInputType.text),
        fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(
        flex: 1,
        child: _crearInputGeneral("UU.EE.", TextInputType.text),
        fit: FlexFit.tight)
  ]));
}
*/
Widget _crearInputNivel(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.nivel = value,
  );
}
