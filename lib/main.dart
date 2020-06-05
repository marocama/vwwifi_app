
import 'package:flutter/material.dart';
import 'package:vwwifi/screens/account.dart';
import 'package:vwwifi/screens/listTransmitters.dart';
import 'package:vwwifi/screens/Login.dart';
import 'package:vwwifi/screens/manageTransmitter.dart';
import 'package:vwwifi/screens/newTransmitter.dart';
import 'package:vwwifi/screens/profile.dart';
import 'package:vwwifi/screens/register.dart';
import 'package:vwwifi/screens/rename.dart';
import 'package:vwwifi/screens/sendCommand.dart';

void main() => runApp(
  MaterialApp(
    title: 'VW WiFi',
    theme: ThemeData(
      brightness:     Brightness.light,
      primaryColor:   Color(0xFF0D47A1),
      accentColor:    Color(0xFF0D47A1),
      splashColor:    Colors.grey[900],
      cardColor:      Colors.white,
      cardTheme:      CardTheme(elevation: 20),
    ),
    darkTheme: ThemeData(
      brightness:     Brightness.dark,
      primaryColor:   Color(0xFF0D47A1),
      accentColor:    Colors.white,
      textSelectionColor: Colors.black,
      splashColor:    Colors.grey[900],
    ),
    themeMode: ThemeMode.dark,
    home: Home(),
    initialRoute: "/home",
    routes: {
        "/transmitter" : (context) => Transmitter(),
        "/home"        : (context) => Home(),
        "/new"         : (context) => InsertTransmitter(),
        "/send"        : (context) => SendCommand(),
        "/profile"     : (context) => Profile(), 
        "/account"     : (context) => Account(),
        "/login"       : (context) => Login(),
        "/register"    : (context) => Register(),
        "/rename"      : (context) => Rename(),
    },
  ),
);