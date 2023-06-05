import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanear/app/data/constants.dart';
import 'package:sanear/app/data/exception.dart';
import 'package:sanear/app/data/models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String lat, String long);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  const RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String lat, String long) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeather(lat, long)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    }

    throw ServerException();
  }
}
