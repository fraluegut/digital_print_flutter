import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetingsUserPage extends StatefulWidget {
  const SetingsUserPage({Key key}) : super(key: key);

  @override
  _SetingsUserPageState createState() => _SetingsUserPageState();
}

class _SetingsUserPageState extends State<SetingsUserPage> {
  String _nombre = "Javi";

  TextEditingController _textController;

  @override
  void iniState() {
    super.initState();
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Preferencias de usuario"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text("Nombre:  ${_nombre}"),
              Divider(),
              Text("Fecha de nacimiento: "),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    helperText: "Nombre de usuario",
                  ),
                  onChanged: (value) {
                    _nombre = value;
                  },
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.send, size: 35.0),
                onPressed: () {
                  print("Nombre:  ${_nombre}");
                },
              ),
            ],
          ),
        ));
  }
}
