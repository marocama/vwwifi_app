import 'package:vwwifi/constants/RouteGenerator.dart';
import 'package:vwwifi/constants/Themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'VW WiFi',
    themeMode: ThemeMode.dark,
    initialRoute: "/listBoard",
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: RouteGenerator.generateRoute,
  ),
);