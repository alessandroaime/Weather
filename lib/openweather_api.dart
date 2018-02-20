import 'dart:async';

import 'package:weather/daily_forecast.dart';
import 'package:weather/utils.dart';

class OpenWeatherAPI {
  final key = '***REMOVED***';

  Future<int> getCurrentTemperature(double lat, double lon) async {
    var url = '/data/2.5/weather';
    var uri = new Uri.https(
      'api.openweathermap.org',
      url,
      {'lat': '$lat', 'lon': '$lon', 'APPID': key, 'units': 'metric'},
    );
    Map<String, dynamic> responseMap = await makeHttpsRequest(uri);
    var temp = responseMap['main']['temp'];
    return temp.toInt();
  }

  Future<List<DailyForecast>> getWeatherForecast(double lat, double lon,
      [int days]) async {
    var cnt = days ?? 7;
    var url = '/data/2.5/forecast';
    var uri = new Uri.https(
      'api.openweathermap.org',
      url,
      {
        'lat': '$lat',
        'lon': '$lon',
        'cnt': '$cnt',
        'APPID': key,
        'units': 'metric'
      },
    );
    Map<String, dynamic> responseMap = await makeHttpsRequest(uri);

    List<DailyForecast> dailyForecastList = new List<DailyForecast>();
    for (var index = 0; index < cnt; index++) {
      var temp = responseMap['list'][index]['main']['temp'];
      var weatherCode = responseMap['list'][index]['weather'][0]['id'];
      DailyForecast dailyForecast = new DailyForecast(temp, weatherCode);
      dailyForecastList.add(dailyForecast);
    }
    return dailyForecastList;
  }
}
