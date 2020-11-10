
import 'package:digital_print/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Print App1',
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Digital Print APP"),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0),
              ),
              Image(image: new AssetImage('assets/images/digital_print.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlertPage(),
                            ));
                          },
                          child: Text(
                            'Empecemos',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          color: Colors.white,
                          splashColor: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Créditos',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          color: Colors.white,
                          splashColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
