import 'package:flutter/material.dart';
import 'package:weather/background_widget.dart';
import 'package:weather/login_widget.dart';
import 'package:weather/weather_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loginStatus = false;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new BackgroundWidget(),
        (loginStatus)
            ? new WeatherWidget()
            : new LoginWidget(() {
                setState(() {
                  loginStatus = true;
                });
              }),
      ],
    );
  }
}
