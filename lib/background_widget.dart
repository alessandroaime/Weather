import 'package:flutter/material.dart';
import 'package:weather/header_painter.dart';

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        alignment: new Alignment(0.5, 0.94),
        children: <Widget>[
          new CustomPaint(
            painter: new HeaderPainter(),
            child: new Container(height: 345.0),
          ),
          new Image.asset(
            'assets/reindeer.png',
            scale: 15.0,
          ),
        ],
      ),
    );
  }
}
