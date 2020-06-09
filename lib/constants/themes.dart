import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color primary  = Color(0xFF0D47A1);

  static final ThemeData lightTheme = ThemeData(
    brightness:     Brightness.light,
    primaryColor:   primary,
    accentColor:    primary,
    splashColor:    Colors.grey[900],
    cardColor:      Colors.white,
    cardTheme:      CardTheme(elevation: 20),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness:     Brightness.dark,
    primaryColor:   primary,
    accentColor:    Colors.white,
    textSelectionColor: Colors.black,
    splashColor:    Colors.grey[900],
  );
}

