import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/remote_data_source.dart';
import '../exception.dart';
import '../failure.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;
  const WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(
      String lat, String long) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(lat, long);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
