import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:weather/header_painter.dart';

class BackgroundWidget extends StatefulWidget {
  _BackgroundWidgetState createState() => new _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Animation<Offset> animationStarOffset;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    animation = new Tween(begin: 0.0, end: 345.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    var beginOffset = new Offset(290.0, 0.0);
    var endOffset = _getEndOffset(beginOffset);
    animationStarOffset =
        new Tween(begin: beginOffset, end: endOffset).animate(controller);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        alignment: new Alignment(0.5, 0.94),
        children: <Widget>[
          new CustomPaint(
            painter:
                new HeaderPainter(animation.value, animationStarOffset.value),
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

  dispose() {
    controller.dispose();
    super.dispose();
  }

  _getRandomBeginOffset() {
    var dy = 0.0;
    var dx = new Random().nextInt(345).toDouble();
    return new Offset(dx, dy);
  }

  _getEndOffset(Offset beginOffset) {
    var radians = 30.0 * pi / 180;
    var dy = 345.0;
    var dx = beginOffset.dx - dy * cos(radians) / sin(radians);
    return new Offset(dx, dy);
  }
}
