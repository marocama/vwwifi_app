import 'package:flutter/material.dart';
import 'package:vwwifi/screens/listTransmitters.dart';

class Routes {
  Routes._(); 
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Home(),
  };
}