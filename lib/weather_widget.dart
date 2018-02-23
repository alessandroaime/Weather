import 'package:flutter/material.dart';
import 'package:weather/daily_forecast.dart';
import 'package:weather/openweather_api.dart';
import 'package:weather/utils.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => new _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  bool _loading = true;
  String _currentLocation;
  int _currentTemperature;
  int _days = 14;
  List<DailyForecast> _weatherForecast;
  List<String> _weekdaysData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? new Text('')
        : new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildLocationLabel(),
              _buildTemperatureLabel(),
              new Expanded(
                child: _buildListView(),
              ),
            ],
          );
  }

  _buildLocationLabel() {
    return new Padding(
      padding: const EdgeInsets.only(top: 116.0, bottom: 8.0),
      child: new Text(
        _currentLocation,
        style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _buildTemperatureLabel() {
    return new Text(
      '$_currentTemperature',
      style: new TextStyle(
        color: Colors.white,
        fontSize: 112.0,
        decoration: TextDecoration.none,
      ),
    );
  }

  _buildListView() {
    return new SafeArea(
      child: new Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: new ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemCount: _days,
          itemBuilder: (context, index) {
            return _buildDailyWeatherRow(
              _weekdaysData[index],
              _weatherForecast[index].temperature,
              _weatherForecast[index].getWeatherIcon(),
              index,
            );
          },
        ),
      ),
    );
  }

  _buildDailyWeatherRow(String day, int temp, IconData icon, int index) {
    var color = (index == 0) ? Colors.black : Colors.grey.withOpacity(0.8);
    return new Padding(
      padding: const EdgeInsets.only(bottom: 40.0, left: 48.0, right: 48.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: _buildWeatherLabel(day, color)),
          _buildWeatherLabel('$tempº', color),
          _buildWeatherIcon(icon, color),
        ],
      ),
    );
  }

  _buildWeatherLabel(String string, Color color) {
    return new Text(
      string,
      style: new TextStyle(
        color: color,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    );
  }

  _buildWeatherIcon(IconData icon, Color color) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 20.0),
      child: new Icon(icon, color: color),
    );
  }

  _fetchData() async {
    var openWeatherAPI = new OpenWeatherAPI();
    var weekdaysData = getWeekdaysList(_days);
    var currentCoord = await getCoordinates();
    var lat = currentCoord[0];
    var lon = currentCoord[1];
    var currentLocation = await getLocation(lat, lon);
    var currentTemperature =
        await openWeatherAPI.getCurrentTemperature(lat, lon);
    var weatherForecast =
        await openWeatherAPI.getWeatherForecast(lat, lon, _days);
    setState(() {
      _weekdaysData = weekdaysData;
      _currentLocation = currentLocation;
      _currentTemperature = currentTemperature;
      _weatherForecast = weatherForecast;
      _loading = false;
    });
  }
}
