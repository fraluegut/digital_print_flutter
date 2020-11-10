import 'package:digital_print/src/pages/alert_page.dart';
import 'package:digital_print/src/pages/home_page.dart';
import 'package:digital_print/src/pages/welcome_page.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => WelcomePage(),
    'home' : (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    
    
  };
}
