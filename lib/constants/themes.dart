

class AppThemes() {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness:     Brightness.light,
    primaryColor:   Color(0xFF0D47A1),
    accentColor:    Color(0xFF0D47A1),
    splashColor:    Colors.grey[900],
    cardColor:      Colors.white,
    cardTheme:      CardTheme(elevation: 20),
  );

  static final ThemeData darkTheme = hemeData(
    brightness:     Brightness.dark,
    primaryColor:   Color(0xFF0D47A1),
    accentColor:    Colors.white,
    textSelectionColor: Colors.black,
    splashColor:    Colors.grey[900],
  ),
}

