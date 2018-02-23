import 'dart:async';

import 'package:weather/daily_forecast.dart';
import 'package:weather/utils.dart';

class OpenWeatherAPI {
  final key = '***REMOVED***';

  Future<Map<String, dynamic>> _getData(String api, double lat, double lon,
      [int cnt]) async {
    var url = '/data/2.5/$api';
    var uri = new Uri.https(
      'api.openweathermap.org',
      url,
      {
        'lat': '$lat',
        'lon': '$lon',
        'cnt': '$cnt',
        'APPID': key,
        'units': 'metric',
      },
    );
    return await makeHttpsRequest(uri);
  }

  Future<int> getCurrentTemperature(double lat, double lon) async {
    Map<String, dynamic> responseMap = await _getData('weather', lat, lon);
    var temperature = responseMap['main']['temp'];

    return temperature.toInt();
  }

  Future<List<DailyForecast>> getWeatherForecast(double lat, double lon, int cnt) async {
    Map<String, dynamic> responseMap = await _getData('forecast', lat, lon, cnt);
    List<DailyForecast> dailyForecastList = [];

    for (var index = 0; index < cnt; index++) {
      var temperature = responseMap['list'][index]['main']['temp'];
      var weather = responseMap['list'][index]['weather'][0]['id'];
      var dailyForecast = new DailyForecast(temperature.toInt(), weather);
      dailyForecastList.add(dailyForecast);
    }

    return dailyForecastList;
  }
}