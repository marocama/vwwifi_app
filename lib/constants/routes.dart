import 'package:flutter/material.dart';
import 'package:vwwifi/screens/Login.dart';
import 'package:vwwifi/screens/account.dart';
import 'package:vwwifi/screens/listTransmitters.dart';
import 'package:vwwifi/screens/manageTransmitter.dart';
import 'package:vwwifi/screens/newTransmitter.dart';
import 'package:vwwifi/screens/profile.dart';
import 'package:vwwifi/screens/register.dart';
import 'package:vwwifi/screens/rename.dart';
import 'package:vwwifi/screens/sendCommand.dart';

class Routes {
  Routes._(); 
  
  static const String home = '/home';
  static const String transmitter = '/transmitter';
  static const String newTransmitter = '/new';
  static const String send = '/send';
  static const String profile = '/profile';
  static const String account = '/account';
  static const String login = '/login';
  static const String register = '/register';
  static const String rename = '/rename';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Home(),
    transmitter: (BuildContext context) => Transmitter(),
    newTransmitter: (BuildContext context) => InsertTransmitter(),
    send: (BuildContext context) => SendCommand(),
    profile: (BuildContext context) => Profile(),
    account: (BuildContext context) => Account(),
    login: (BuildContext context) => Login(),
    register: (BuildContext context) => Register(),
    rename: (BuildContext context) => Rename(),
  };
}