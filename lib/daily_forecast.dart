import 'package:flutter/material.dart';
import 'package:weather/weather_fonts.dart';

class DailyForecast {
  double temp;
  //double maxTemp;
  //double minTemp;
  int weatherCode;

  DailyForecast(this.temp, this.weatherCode);

  IconData getWeatherIcon() {
    switch (weatherCode) {
      case 200: case 201: case 202: case 210: case 230: case 231: case 232:
        return WeatherFonts.stormShowers;
      case 211: case 212: case 221: case 960: case 961: case 962:
        return WeatherFonts.thunderstorm;
      case 300: case 301: case 302: case 310: case 311: case 312: case 313: case 314: case 321: case 701:
        return WeatherFonts.sprinkle;
      case 500: case 501: case 502: case 503: case 504:
        return WeatherFonts.rain;
      case 511: case 615: case 616: case 620: case 621: case 622:
        return WeatherFonts.rainMix;
      case 520: case 521: case 522: case 531:
        return WeatherFonts.showers;
      case 600: case 601: case 602:
        return WeatherFonts.snow;
      case 611: case 612:
        return WeatherFonts.sleet;
      case 711:
        return WeatherFonts.smoke;
      case 721:
        return WeatherFonts.dayHaze;
      case 731: case 751: case 952: case 953: case 954: case 955: case 956: case 957: case 958: case 959:
        return WeatherFonts.cloudyGusts;
      case 741:
        return WeatherFonts.fog;
      case 761:
        return WeatherFonts.dust;
      case 762:
        return WeatherFonts.smog;
      case 771:
        return WeatherFonts.dayWindy;
      case 781: case 900:
        return WeatherFonts.tornado;
      case 800: case 951:
        return WeatherFonts.sunny;
      case 801: case 802: case 803: case 804:
        return WeatherFonts.cloudy;
      case 901: case 902:
        return WeatherFonts.hurricane;
      case 903:
        return WeatherFonts.snowflakeCold;
      case 904:
        return WeatherFonts.hot;
      case 905:
        return WeatherFonts.windy;
      case 906:
        return WeatherFonts.hail;
      default:
        return null;
    }
  }
}
