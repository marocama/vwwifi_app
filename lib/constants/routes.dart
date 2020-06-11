import 'package:flutter/material.dart';
import 'package:vwwifi/screens/ListBord.dart';
import 'package:vwwifi/screens/Login.dart';
import 'package:vwwifi/screens/account.dart';
import 'package:vwwifi/screens/listTransmitters.dart';
import 'package:vwwifi/screens/manageTransmitter.dart';
import 'package:vwwifi/screens/newTransmitter.dart';
import 'package:vwwifi/screens/profile.dart';
import 'package:vwwifi/screens/Register.dart';
import 'package:vwwifi/screens/rename.dart';
import 'package:vwwifi/screens/sendCommand.dart';

class Routes {
  Routes._(); 

  static final routes = <String, WidgetBuilder>{
    '/login': (BuildContext context) => Login(),
    '/register': (BuildContext context) => Register(),
    '/listBoard' : (BuildContext context) => ListBoard(),
  };
}