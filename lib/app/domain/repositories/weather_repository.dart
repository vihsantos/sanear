import 'package:dartz/dartz.dart';
import 'package:sanear/app//data/failure.dart';
import 'package:sanear/app//domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
