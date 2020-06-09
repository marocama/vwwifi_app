import 'package:flutter/material.dart';
import 'package:vwwifi/constants/routes.dart';
import 'package:vwwifi/constants/themes.dart';
import 'package:vwwifi/screens/listTransmitters.dart';

void main() => runApp(
  MaterialApp(
    title: 'VW WiFi',
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    themeMode: ThemeMode.dark,
    home: Home(),
    initialRoute: "/home",
    routes: Routes.routes,
  ),
);