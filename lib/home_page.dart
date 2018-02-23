import 'package:flutter/material.dart';
import 'package:weather/background_widget.dart';
import 'package:weather/weather_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new BackgroundWidget(),
        new WeatherWidget(),
      ],
    );
  }
}
