import 'package:flutter/material.dart';
import 'package:vwwifi/screens/listTransmitters.dart';
import 'package:vwwifi/screens/manageTransmitter.dart';

void main() => runApp(MaterialApp(
  title: 'WiFi VW',
  theme: ThemeData(
    primarySwatch: Colors.indigo,
  ),
  home: Transmitter(),
)
);
