import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sanear/app/data/datasources/remote_data_source.dart';
import 'package:sanear/app/data/repositories/weather_repository_impl.dart';
import 'package:sanear/app/domain/repositories/weather_repository.dart';
import 'package:sanear/app/domain/use_cases/get_current_weather.dart';
import 'package:sanear/app/presentation/controllers/sos_controller.dart';

class Injection {
  final locator = GetIt.instance;

  void init() {
    // external
    locator.registerLazySingleton(() => http.Client());

    // datasource
    locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: locator()));

    //repository
    locator.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(remoteDataSource: locator()));

    // usecase
    locator.registerLazySingleton(() => GetCurrentWeather(locator()));

    // Controller
    locator.registerFactory(() => SosController(locator()));
  }
}
