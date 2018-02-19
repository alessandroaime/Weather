import 'package:flutter/material.dart';
import 'package:weather/utils.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => new _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  int _currentTemperature;
  String _currentLocation;
  List<String> _weatherForecast;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: (_loading)
          ? [new Text('')]
          : <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 110.0, bottom: 10.0),
                child: new Text(
                  'Helsinki',
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 25.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: new Text(
                  '$_currentTemperatureº',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 110.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              new Expanded(
                child: _buildListView(),
              ),
            ],
    );
  }

  _buildListView() {
    return new ListView(
      children: <Widget>[
        _buildDailyWeatherRow('Monday', _weatherForecast[0], Icons.wb_cloudy),
        _buildDailyWeatherRow('Tuesday', _weatherForecast[2], Icons.wb_cloudy),
        _buildDailyWeatherRow(
            'Wednesday', _weatherForecast[4], Icons.wb_cloudy),
        _buildDailyWeatherRow('Thursday', _weatherForecast[6], Icons.wb_cloudy),
        _buildDailyWeatherRow('Friday', _weatherForecast[8], Icons.wb_cloudy),
        _buildDailyWeatherRow(
            'Saturday', _weatherForecast[10], Icons.wb_cloudy),
        _buildDailyWeatherRow('Sunday', _weatherForecast[12], Icons.wb_cloudy),
      ],
    );
  }

  _buildDailyWeatherRow(String day, String temperature, IconData icon) {
    return new Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: _buildText(day),
          ),
          _buildText('$temperatureº'),
          _buildIcon(icon),
        ],
      ),
    );
  }

  _buildText(String string) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 55.0),
      child: new Text(
        string,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _buildIcon(IconData icon) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 55.0, left: 20.0, right: 50.0),
      child: new Icon(icon),
    );
  }

  _fetchData() async {
    await _getCurrentTemperature();
    await _getWeatherForecast();
    setState(() {
      _loading = false;
    });
  }

  _getCurrentTemperature() async {
    var currentTemperature = await getCurrentTemperature();
    setState(() {
      _currentTemperature = currentTemperature;
    });
  }

  _getWeatherForecast() async {
    var weatherForecast = await getWeatherForecast();
    setState(() {
      _weatherForecast = weatherForecast;
    });
  }
}
