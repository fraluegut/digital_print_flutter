import 'package:digital_print/src/models/elemento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';


// Variables

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);


// MAIN CLASS
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Elemento elemento = new Elemento();
final int valor = 0;
final formKey = GlobalKey<FormState>();
final myController = TextEditingController();

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
                    _head(),
                    Divider(thickness: 6.0),
                    SizedBox(height: 10.0),
                    _subtitle(),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    _location(),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    _identification(),
                    //Divider(thickness: 6.0),
                    //_restauracion(context),
                    SizedBox(height: 10.0),
                    Divider(thickness: 6.0),
                    SizedBox(height: 10.0),
                    _submit(),
                    SizedBox(height: 500.0),
                  ],
                ))));
  }
}

// General Widgets

// HEAD

Widget _head() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [Row( children: [
                  Text("Baza-1 (Baza, Granada)"),
                  SizedBox(width: 40.0),
                  Text(formattedDate),],),
              SizedBox(height: 20.0),
              Text("Excavador: Fulanito y Menganito"),
            ],
          ),
        ),
      ],
    )
  );
}

// SUBTITLE

Widget _subtitle() {
  return IntrinsicHeight(
      child: Row(children: <Widget>[
    Flexible(flex: 1,
        child: _crearInputCuadro("Cuadro", TextInputType.text),
        fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(flex: 1,
        child: _crearInputNivel("Nivel estr.", TextInputType.text),
        fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(flex: 1,
        child: _crearInputUUEE("UU.EE.", TextInputType.text),
        fit: FlexFit.tight)
  ]));
}

// LOCATION

Widget _location() {
return IntrinsicHeight(
  child: Column(children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Text("Localización",
          style: TextStyle(color: Colors.grey, fontSize: 15),
          textAlign: TextAlign.left),
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    SizedBox(height: 5.0),
                    _crearInputRotX("Rot X", TextInputType.number),
                    SizedBox(height: 5.0),
                    _crearInputRotY("Rot Y", TextInputType.number),
                    SizedBox(height: 5.0),
                    _crearInputRotZ("Rot Z", TextInputType.number),
                  ],),
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
          ]),]));
}

// IDENTIFICATION

Widget _identification() {
return IntrinsicHeight(
child: Column(
children: <Widget>[
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
        _crearInputMaterial("Material", TextInputType.text),
        SizedBox(height: 5.0),
        _crearInputElemento("Elemento", TextInputType.text),
        SizedBox(height: 5.0),
        _crearInputObservacionesIdentificacion(
            "Observaciones", TextInputType.text),
        SizedBox(height: 5.0)
      ]),
      fit: FlexFit.tight),
    SizedBox(width: 10.0),
    Flexible(
      flex: 1,
      child: Column(
        children: [ _crearInputTalla("Talla", TextInputType.text),
          SizedBox(height: 5.0),_crearInputGenero("Género", TextInputType.text),
          SizedBox(height: 5.0), _crearInputFamilia("Familia", TextInputType.text),
          SizedBox(height: 5.0),_crearInputEspecie("Especie", TextInputType.text),
        ],),
      fit: FlexFit.tight),
    SizedBox(width: 10.0),
  ])),
  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
]));
}

// SUBMIT

Widget _submit() {
return Row(children: <Widget>[
Flexible(
  flex: 1,
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    FloatingActionButton(
        heroTag: "botondelete",
        child: Icon(Icons.delete_forever, size: 40.0), onPressed: () {}),
    SizedBox(height: 5.0),
    FloatingActionButton(
      heroTag:  "botonprint",
        child: Icon(Icons.print, size: 35.0), onPressed: () {}),
    SizedBox(height: 5.0),
    FloatingActionButton(
      heroTag: "botonpost",
      child: Icon(Icons.send, size: 35.0),
      onPressed: _makePostRequest,
    ), ]),
    fit: FlexFit.tight),
SizedBox(width: 10.0),
]);
}

// MAKE POST REQUEST

_makePostRequest() async {
  formKey.currentState.validate();
  formKey.currentState.save();
  // set up POST request arguments 'http://185.254.206.143:5001/registrobaza';
  String url = 'http://185.254.206.143:5000/registrobaza';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = //'{"excavador": "Javier","cuadro": "${elemento.cuadro}",  "nivel": "${elemento.nivel}","uuee": ${elemento.uuee},  localizacionX": ${elemento.localizacionX}, "localizacionY":${elemento.localizacionY},"localizacionZi": ${elemento.localizacionZi},"localizacionZs": ${elemento.localizacionZs}, "coord_aprox": 1,  "rotX": ${elemento.rotX}, "rotY": ${elemento.rotY}, "rotZ": ${elemento.rotZ},"largo": ${elemento.largo},"ancho": ${elemento.ancho},"espesor": ${elemento.espesor},"material": "${elemento.material}","elemento": "${elemento.elemento}", "observaciones_identificacion":" ${elemento.observacionesIdentificacion}","talla": "${elemento.talla}", "genero": "${elemento.genero}", "familia": "${elemento.familia}","especie": "${elemento.especie}","consolidacion": "${elemento.consolidacion}","estado":"${elemento.estado}","extraccion": "${elemento.extraccion}","foto": 0,"observaciones_restauracion": "${elemento.observacionesRestauracion}"}';
  '{"ancho": ${elemento.ancho}, "consolidacion": 1,"coord_aprox": 1,"cuadro": ${elemento.cuadro}, "elemento": ${elemento.elemento},"especie": ${elemento.especie}, "espesor": ${elemento.espesor}, "estado": ${elemento.estado},  "excavador": ${elemento.excavador},    "extraccion": 0,    "familia": ${elemento.familia},    "foto": 0,    "genero": ${elemento.genero},"largo": ${elemento.largo},    "localizacionX": ${elemento.localizacionX},    "localizacionY": ${elemento.localizacionY},    "localizacionZi": ${elemento.localizacionZi},    "localizacionZs": ${elemento.localizacionZs},    "material": "${elemento.material}",    "nivel": ${elemento.nivel},    "observaciones_identificacion": ${elemento.observacionesIdentificacion},    "observaciones_restauracion": ${elemento.observacionesRestauracion},   "rotX": ${elemento.rotX},    "rotY": ${elemento.rotY},    "rotZ": ${elemento.rotZ},    "talla": ${elemento.talla},    "uuee": ${elemento.uuee}}';
      //'{"excavador": ${elemento.excavador}, "cuadro": "1","nivel": "2","uuee": "2","localizacionX": 2,"localizacionY": 2,"localizacionZs": 2,"localizacionZi": 2,"largo": 2,"ancho": 2,"espesor": 2,"material": "prueba2"}';
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




// SMALL WIDGETS

// WIDGETS FROM SUBTITLE

Widget _crearInputCuadro(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.cuadro = value,
  );
}

Widget _crearInputNivel(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.nivel = value,
  );
}

Widget _crearInputUUEE(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.uuee = value,
  );
}


// WIDGETS FROM LOCATION

Widget _crearInputlocalizacionX(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
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
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.largo = int.parse(value),
  );
}

Widget _crearInputAncho(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.ancho = int.parse(value),
  );
}

Widget _crearInputEspesor(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.espesor = int.parse(value),
  );
}


// WIDGETS FROM IDENTIFICATION

Widget _crearInputMaterial(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.material = value,
  );
}

Widget _crearInputElemento(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.elemento = value,
  );
}

Widget _crearInputObservacionesIdentificacion(
    String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.observacionesIdentificacion = value,
  );
}

Widget _crearInputTalla(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.talla = value,
  );
}

Widget _crearInputGenero(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.genero = value,
  );
}

Widget _crearInputFamilia(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.familia = value,
  );
}

Widget _crearInputEspecie(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.especie = value,
  );
}

// WIDGETS FROM RESTAURATION

Widget _crearInputEstado(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.estado = value,
  );
}

Widget _crearInputConsolidacion(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.consolidacion = value,
  );
}

Widget _crearInputExtraccion(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.extraccion = int.parse(value),
  );
}

Widget _crearInputObservacionesRestauracion(String texto, TextInputType tipo) {
  return TextFormField(
    keyboardType: tipo,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: texto,
      labelText: texto,
      //helperText: texto,
    ),
    onSaved: (value) => elemento.observacionesRestauracion = value,
  );
}


