import 'package:flutter/material.dart';
import 'package:weather/utils.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback loginCallback;

  LoginWidget(this.loginCallback);

  @override
  _LoginWidgetState createState() => new _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(
            top: 60.0,
            bottom: 55.0,
            left: 50.0,
            right: 50.0,
          ),
          child: _buildLoginField('Account', Icons.person, false),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: _buildLoginField('Password', Icons.lock, true),
        ),
        _buildLoginButton(),
      ],
    );
  }

  _buildLoginField(String hintText, IconData icon, bool obscureText) {
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

  _buildLoginButton() {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 55.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade200,
        elevation: 10.0,
        child: new MaterialButton(
          minWidth: 300.0,
          height: 50.0,
          onPressed: () {
            getWeatherForecast();
            if (true)
              widget.loginCallback();
            else
              print('Error');
          },
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
