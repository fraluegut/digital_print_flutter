
import 'package:digital_print/routes/routes.dart';
import 'package:digital_print/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      // home: HomePage());
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print("Ruta llamada: ${settings.name}");

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}