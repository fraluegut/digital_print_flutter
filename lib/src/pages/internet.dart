import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: StarWarsData(),
  ));
}

class StarWarsData extends StatefulWidget {
  @override
  StarWarsState createState() => StarWarsState();
}

class StarWarsState extends State<StarWarsData> {
  final String url = "/http://185.254.206.143:5000//registrobaza";
  List data;

  Future<String> getSWData() async {
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      print("EY");
      data = resBody;
      print(res);
      print("EY");
      print(data);
      print(data.length);
      print(data[0]);
      //print(data);
      //print(data);
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registros"),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: 
                        Column(children: [
                          Row(
                            children: <Widget>[
                              Text("ID: "),
                              Text(data[index]["id"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              ],
                          
                        ),
                        Row(
                            children: <Widget>[
                              Text("Excavador: "),
                              Text(data[index]["excavador"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              Text("Fecha: "),
                              Text(data[index]["registro"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Cuadro: "),
                              Text(data[index]["cuadro"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              Text("Nivel: "),
                              Text(data[index]["nivel"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              Text("UUEE: "),
                              Text(data[index]["uuee"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Elemento: "),
                              Text(data[index]["elemento"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              Text("Material: "),
                              Text(data[index]["material"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Talla: "),
                              Text(data[index]["talla"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              Text("Género: "),
                              Text(data[index]["genero"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Especie: "),
                              Text(data[index]["talla"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("X: "),
                              Text(data[index]["localizacionX"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Y: "),
                              Text(data[index]["localizacionY"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Zs: "),
                              Text(data[index]["localizacionZs"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Zi: "),
                              Text(data[index]["localizacionZi"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              
                              
                              
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Rot. X: "),
                              Text(data[index]["rotX"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Rot. Y: "),
                              Text(data[index]["rotY"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Rot. Z: "),
                              Text(data[index]["rotZ"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              
                              
                              
                              
                              ],
                        ),
                        Row(
                            children: <Widget>[
                              Text("Largo: "),
                              Text(data[index]["largo"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Ancho: "),
                              Text(data[index]["ancho"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              Text("Espesor: "),
                              Text(data[index]["espesor"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              SizedBox(width: 10.0),
                              
                              
                              
                              
                              
                              ],
                        ),
                        SizedBox(height: 10.0),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              
                               SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                heroTag: "botonview",
                                child: Icon(Icons.remove_red_eye, size: 25.0),
                                onPressed: (){}),
                              ),
                              SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                heroTag: "botonedit",
                                child: Icon(Icons.edit, size: 20.0),
                                onPressed: (){}),
                              ),
                              
                              SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                heroTag: "botonprint",
                                child: Icon(Icons.print, size: 25.0),
                                onPressed: (){}),
                              ),
                              SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                heroTag: "botondelete",
                                child: Icon(Icons.delete_forever, size: 25.0),
                                onPressed: (){}),
                              ),
                              ],
                              
                        ),
                        ])),
                  ),
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}
