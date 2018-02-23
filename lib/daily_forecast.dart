import 'package:flutter/material.dart';
import 'package:weather/weather_font.dart';

class DailyForecast {
  static const List<int> stormCodes = const [200, 201, 202, 210, 230, 231, 232];
  static const List<int> thunderstormCodes = const [211, 212, 221, 960, 961, 962];
  static const List<int> sprinkleCodes = const [300, 301, 302, 310, 311, 312, 313, 314, 321, 701];
  static const List<int> rainCodes = const [500, 501, 502, 503, 504];
  static const List<int> rainMixCodes = const [511, 615, 616, 620, 621, 622];
  static const List<int> showersCodes = const [520, 521, 522, 531];
  static const List<int> snowCodes= const [600, 601, 602];
  static const List<int> sleetCodes = const [611, 612];
  static const int smokeCode = 711;
  static const int dayHazeCode = 721;
  static const List<int> cloudyGustsCodes = const [731, 751, 952, 953, 954, 955, 956, 957, 958, 959];
  static const int fogCode = 741;
  static const int dustCode = 761;
  static const int smogCode = 762;
  static const int dayWindyCode = 771;
  static const List<int> tornadoCodes = const [781, 900];
  static const List<int> sunnyCodes = const [800, 951];
  static const List<int> cloudyCodes = const [801, 802, 803, 804];
  static const List<int> hurricaneCodes = const [901, 902];
  static const int snowflakeColdCode = 903;
  static const int hotCode = 904;
  static const int windyCode = 905;
  static const int hailCode = 906;

  DailyForecast(this.temperature, this.weather);

  final int temperature;
  final int weather;

  IconData getWeatherIcon() {
    if (stormCodes.contains(weather)) {
      return WeatherFont.stormShowers;
    } else if (thunderstormCodes.contains(weather)) {
      return WeatherFont.thunderstorm;
    } else if (sprinkleCodes.contains(weather)) {
      return WeatherFont.sprinkle;
    } else if (rainCodes.contains(weather)) {
      return WeatherFont.rain;
    } else if (rainMixCodes.contains(weather)) {
      return WeatherFont.rainMix;
    } else if (showersCodes.contains(weather)) {
      return WeatherFont.showers;
    } else if (snowCodes.contains(weather)) {
      return WeatherFont.snow;
    } else if (sleetCodes.contains(weather)) {
      return WeatherFont.sleet;
    } else if (smokeCode == weather) {
      return WeatherFont.smoke;
    } else if (dayHazeCode == weather) {
      return WeatherFont.dayHaze;
    } else if (cloudyGustsCodes.contains(weather)) {
      return WeatherFont.cloudyGusts;
    } else if (fogCode == weather) {
      return WeatherFont.fog;
    } else if (dustCode == weather) {
      return WeatherFont.dust;
    } else if (smogCode == weather) {
      return WeatherFont.smog;
    } else if (dayWindyCode == weather) {
      return WeatherFont.dayWindy;
    } else if (tornadoCodes.contains(weather)) {
      return WeatherFont.tornado;
    } else if (sunnyCodes.contains(weather)) {
      return WeatherFont.sunny;
    } else if (cloudyCodes.contains(weather)) {
      return WeatherFont.cloudy;
    } else if (hurricaneCodes.contains(hurricaneCodes)) {
      return WeatherFont.hurricane;
    } else if (snowflakeColdCode == weather) {
      return WeatherFont.snowflakeCold;
    } else if (hotCode == weather) {
      return WeatherFont.hot;
    } else if (windyCode == weather) {
      return WeatherFont.windy;
    } else if (hailCode == weather) {
      return WeatherFont.hail;
    } else {
      return null;
    }
  }
}
