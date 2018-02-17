import 'package:flutter/material.dart';
import 'package:weather/header_painter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        alignment: Alignment.lerp(
            Alignment.lerp(Alignment.centerRight, Alignment.center, 0.3),
            Alignment.topCenter,
            0.15),
        children: <Widget>[
          new Column(
            children: [
              new CustomPaint(
                painter: new HeaderPainter(),
                child: new Container(height: 345.0),
              ),
              new Padding(
                padding: new EdgeInsets.only(
                  top: 60.0,
                  bottom: 55.0,
                  left: 50.0,
                  right: 50.0,
                ),
                child: _returnLoginField('Account', Icons.person, false),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: _returnLoginField('Password', Icons.lock, true),
              ),
              _returnLoginButton()
            ],
          ),
          new Image.asset(
            'assets/reindeer.png',
            scale: 15.0,
          ),
        ],
      ),
    );
  }

  _returnLoginField(String hintText, IconData icon, bool obscureText) {
    return new TextField(
      style: new TextStyle(fontSize: 15.0),
      obscureText: obscureText,
      decoration: new InputDecoration(
        contentPadding: new EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 1.0,
        ),
        hintText: hintText,
        icon: new Icon(
          icon,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  _returnLoginButton() {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 55.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade200,
        elevation: 10.0,
        child: new MaterialButton(
          minWidth: 300.0,
          height: 50.0,
          onPressed: () {},
          color: Colors.lightBlueAccent,
          child: new Text(
            'Log In',
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
