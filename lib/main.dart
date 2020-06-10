import 'package:flutter/material.dart';
import 'package:vwwifi/screens/Login.dart';
import 'package:vwwifi/constants/Routes.dart';
import 'package:vwwifi/constants/Themes.dart';
import 'package:vwwifi/screens/listTransmitters.dart';

void main() => runApp(
  MaterialApp(
    title: 'VW WiFi',
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    themeMode: ThemeMode.dark,
    home: Login(),
    initialRoute: "/login",
    routes: Routes.routes,
    debugShowCheckedModeBanner: false,
  ),
);