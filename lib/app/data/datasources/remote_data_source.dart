import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanear/app/data/constants.dart';
import 'package:sanear/app/data/exception.dart';
import 'package:sanear/app/data/models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  const RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    }

    throw ServerException();
  }
}
