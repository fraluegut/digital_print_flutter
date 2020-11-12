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
  // Valores de localización:

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
  return 
    Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Container(
                  child: Column(
                children: [
                  _crearInputlocalizacionX("X", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputlocalizacionY("Y", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputlocalizacionZs("Zs", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputlocalizacionZi("Zi", TextInputType.number),
                ],
              ))),
          SizedBox(width: 10.0),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  _coordAprox(),
                  SizedBox(height: 5.0),
                  _crearInputRotX("Rot X", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputRotY("Rot Y", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputRotZ("Rot Z", TextInputType.number),
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
                  _crearInputLargo("Largo", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputAncho("Ancho", TextInputType.number),
                  SizedBox(height: 5.0),
                  _crearInputEspesor("Espesor", TextInputType.number),
                ],
              ),
              fit: FlexFit.tight)
        ]
    ),
  );
  

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

Widget _crearInputlocalizacionX(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.localizacionX = int.parse(value),
  );
}

Widget _crearInputlocalizacionY(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.localizacionY = int.parse(value),
    validator: (value) {
      if (int.parse(value) > 100) {
        return "El valor Y no puede ser mayor a 100";
      } else {
        return null;
      }
    },
  );
}

Widget _crearInputlocalizacionZs(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.localizacionZs = int.parse(value),
  );
}

Widget _crearInputlocalizacionZi(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.localizacionZi = int.parse(value),
  );
}

Widget _crearInputRotX(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.rotX = int.parse(value),
  );
}

Widget _crearInputRotY(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.rotY = int.parse(value),
  );
}

Widget _crearInputRotZ(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.rotZ = int.parse(value),
  );
}

Widget _crearInputLargo(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.largo  = int.parse(value),
  );
}

Widget _crearInputAncho(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.ancho  = int.parse(value),
  );
}

Widget _crearInputEspesor(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.espesor  = int.parse(value),
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
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
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
  print(elemento.localizacionX);
}

_makePostRequest() async {
  formKey.currentState.validate();
  formKey.currentState.save();
  // set up POST request arguments 'http://185.254.206.143:5001/registrobaza';
  String url = 'http://192.168.1.116:5000/registrobaza';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json =
      '{"ancho": ${elemento.ancho}, "consolidacion": 0,"coord_aprox": 1,"cuadro": "${elemento.cuadro}", "elemento": "${elemento.elemento}","especie": "${elemento.especie}", "espesor": ${elemento.espesor}, "estado": "${elemento.estado}",  "excavador": "${elemento.excavador}",    "extraccion": 0,    "familia": "${elemento.familia}",    "foto": 0,    "genero": "${elemento.genero}","largo": ${elemento.largo},    "localizacionX": ${elemento.localizacionX},    "localizacionY": ${elemento.localizacionY},    "localizacionZi": ${elemento.localizacionZi},    "localizacionZs": ${elemento.localizacionZs},    "material": "${elemento.material}",    "nivel": "${elemento.nivel}",    "observaciones_identificacion": "${elemento.observacionesIdentificacion}",    "observaciones_restauracion": "${elemento.observacionesRestauracion}",   "rotX": ${elemento.rotX},    "rotY": ${elemento.rotY},    "rotZ": ${elemento.rotZ},    "talla": "${elemento.talla}",    "uuee": 2}';
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
