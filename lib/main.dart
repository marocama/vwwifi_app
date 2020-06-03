
import 'package:flutter/material.dart';
import 'package:vwwifi/screens/account.dart';
import 'package:vwwifi/screens/listTransmitters.dart';
import 'package:vwwifi/screens/login.dart';
import 'package:vwwifi/screens/manageTransmitter.dart';
import 'package:vwwifi/screens/newTransmitter.dart';
import 'package:vwwifi/screens/profile.dart';
import 'package:vwwifi/screens/sendCommand.dart';

void main() => runApp(
  MaterialApp(
    title: 'WiFi VW',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
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
    },
  )
);
