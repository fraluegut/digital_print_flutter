import 'package:digital_print/src/pages/index_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Print App',
      initialRoute: "index",
      routes: {
        "index": (BuildContext context) => IndexPage(),
      },
    );
  }
}
