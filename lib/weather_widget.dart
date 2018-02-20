import 'package:flutter/material.dart';
import 'package:weather/daily_forecast.dart';
import 'package:weather/openweather_api.dart';
import 'package:weather/utils.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => new _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  int _currentTemperature;
  String _currentLocation;
  List<String> _weekdaysData;
  List<DailyForecast> _weatherForecast;
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
                  _currentLocation,
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
    return new ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return _buildDailyWeatherRow(
            _weekdaysData[index],
            _weatherForecast[index].temp.toInt(),
            _weatherForecast[index].getWeatherIcon());
      },
    );
  }

  _buildDailyWeatherRow(String day, int temp, IconData icon) {
    return new Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: _buildText(day),
          ),
          _buildText('$tempº'),
          _buildIcon(icon),
        ],
      ),
    );
  }

  _buildText(String string) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 45.0),
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
    final OpenWeatherAPI openWeatherAPI = new OpenWeatherAPI();
    var weekdaysData = getWeekdaysList(7);
    var currentCoord = await getCoordinates();
    var lat = currentCoord[0];
    var lon = currentCoord[1];
    var currentLocation = await getLocation(lat, lon);
    var currentTemperature =
        await openWeatherAPI.getCurrentTemperature(lat, lon);
    var weatherForecast = await openWeatherAPI.getWeatherForecast(lat, lon, 7);
    setState(() {
      _weekdaysData = weekdaysData;
      _currentLocation = currentLocation[0];
      _currentTemperature = currentTemperature;
      _weatherForecast = weatherForecast;
      _loading = false;
    });
  }
}
