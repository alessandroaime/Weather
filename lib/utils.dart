import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:location/location.dart';

Future<Map<String, double>> _getCoordinates() async {
  var currentLocation = <String, double>{};
  var location = new Location();

  try {
    currentLocation = await location.getLocation;
  } on PlatformException {
    currentLocation = null;
  }
  return currentLocation;
}

Future<int> getCurrentTemperature() async {
  Map<String, double> currentLocation = await _getCoordinates();
  var latitude = currentLocation["latitude"].toString();
  var longitude = currentLocation["longitude"].toString();
  var key = '***REMOVED***';

  var urlCurrentWeather = '/data/2.5/weather';
  var httpClient = new HttpClient();
  var uri = new Uri.https(
    'api.openweathermap.org',
    urlCurrentWeather,
    {'lat': latitude, 'lon': longitude, 'APPID': key},
  );
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
  Map<String, dynamic> responseMap = JSON.decode(responseBody);
  var kelvinTemperature = responseMap['main']['temp'];
  var celsiusTemperature = _kelvinToCelsius(kelvinTemperature);
  return celsiusTemperature.toInt();
}

Future<List<dynamic>> getWeatherForecast() async {
  Map<String, double> currentLocation = await _getCoordinates();
  var latitude = currentLocation["latitude"].toString();
  var longitude = currentLocation["longitude"].toString();
  var key = '***REMOVED***';

  var urlWeekWeather = '/data/2.5/forecast';
  var httpClient = new HttpClient();
  var uri = new Uri.https(
    'api.openweathermap.org',
    urlWeekWeather,
    {'lat': latitude, 'lon': longitude, 'cnt': '7', 'APPID': key},
  );
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
  Map<String, dynamic> responseMap = JSON.decode(responseBody);
  var weatherForecastData = [];
  for (var index = 0; index < 7; index++) {
    var kelvinTemperature = responseMap['list'][index]['main']['temp'];
    weatherForecastData.add(_kelvinToCelsius(kelvinTemperature).toInt().toString());
    weatherForecastData.add(responseMap['list'][index]['weather'][0]['main']);
  }
  return weatherForecastData;
}

double _kelvinToCelsius(double kelvinTemperature) {
  return kelvinTemperature - 273.15;
}
