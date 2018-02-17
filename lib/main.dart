import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/login_page.dart';

void main() => runApp(new WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return new MaterialApp(
      title: 'Weather',
      home: new LoginPage(),
      theme: new ThemeData(
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.lightBlueAccent,
      ),
    );
  }
}
