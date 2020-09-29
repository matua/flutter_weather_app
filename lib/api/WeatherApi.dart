import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:red_weather/models/WeatherForecast.dart';
import 'package:red_weather/utilities/Constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String cityName}) async {
    var queryParameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_BASE_PATH, queryParameters);

    log('request:  ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
