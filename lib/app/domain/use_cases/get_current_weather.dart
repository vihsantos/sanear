import 'package:dartz/dartz.dart';
import 'package:sanear/app//data/failure.dart';
import 'package:sanear/app//domain/entities/weather.dart';
import 'package:sanear/app//domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository _repository;

  GetCurrentWeather(this._repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return _repository.getCurrentWeather(cityName);
  }
}
