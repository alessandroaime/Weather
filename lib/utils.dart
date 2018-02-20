import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

Future<Map<String, dynamic>> makeHttpsRequest(Uri uri) async {
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
  Map<String, dynamic> responseMap = JSON.decode(responseBody);
  return responseMap;
}

Future<List<double>> getCoordinates() async {
  var location = <String, double>{};

  try {
    location = await new Location().getLocation;
  } on PlatformException {
    location = null;
  }

  var lat = location["latitude"];
  var lon = location["longitude"];

  return [lat, lon];
}

Future<List<String>> getLocation(double lat, double lon) async {
  var key = 'AIzaSyDXfRKOQt21POVoCe5bXu6BqorqqPwqyWg';

  var url = '/maps/api/geocode/json';
  var uri = new Uri.https(
    'maps.googleapis.com',
    url,
    {'latlng': ('$lat, $lon'), 'key': key},
  );
  Map<String, dynamic> responseMap = await makeHttpsRequest(uri);
  var city = responseMap['results'][0]['address_components'][2]['long_name'];
  var country =
      responseMap['results'][0]['address_components'][4]['short_name'];
  return [city, country];
}

List<String> getWeekdaysList(int length) {
  List<String> weekdaysList = [];
  var now = new DateTime.now();
  var formatter = new DateFormat('EEEE');

  for (int i = 0; i < length; i++) {
    String formatted = formatter.format(now.add(new Duration(days: i)));
    weekdaysList.add(formatted);
  }

  return weekdaysList;
}
