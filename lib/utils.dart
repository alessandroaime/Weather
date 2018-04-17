import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:location/location.dart';

Future<Map<String, dynamic>> makeHttpsRequest(Uri uri) async {
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  Map<String, dynamic> responseMap = json.decode(responseBody);

  return responseMap;
}

Future<List<double>> getCoordinates() async {
  Map<String, double> location = await new Location().getLocation;
  double lat = location["latitude"];
  double lon = location["longitude"];

  return [lat, lon];
}

Future<String> getLocation(double lat, double lon) async {
  var key = 'AIzaSyDXfRKOQt21POVoCe5bXu6BqorqqPwqyWg';
  var url = '/maps/api/geocode/json';
  var uri = new Uri.https(
    'maps.googleapis.com',
    url,
    {'latlng': ('$lat, $lon'), 'key': key},
  );

  Map<String, dynamic> responseMap = await makeHttpsRequest(uri);
  var city = responseMap['results'][0]['address_components'][2]['long_name'];

  return city;
}

List<String> getWeekdaysList(int length) {
  List<String> weekdaysList = [];
  var now = new DateTime.now();
  var formatter = new DateFormat('EEEE');

  for (int i = 0; i < length; i++) {
    var weekday = formatter.format(now.add(new Duration(days: i)));
    weekdaysList.add(weekday);
  }

  return weekdaysList;
}
