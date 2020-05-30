import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/Home.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.grey[800],
    scaffoldBackgroundColor: Colors.grey[900],
    fontFamily: 'Montserrat',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,
      home: Home(),
    );
  }
}
