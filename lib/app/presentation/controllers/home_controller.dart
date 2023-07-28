import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sanear/app/domain/entities/weather.dart';
import 'package:sanear/app/domain/use_cases/get_current_weather.dart';

class HomeController {
  final GetCurrentWeather _getCurrentWeather;

  HomeController(this._getCurrentWeather);

  ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(true);
  ValueNotifier<Weather?> weatherNotifier = ValueNotifier<Weather?>(null);

  set _loading(bool load) => loadingNotifier.value = load;
  set _weather(Weather weather) => weatherNotifier.value = weather;

  bool get loading => loadingNotifier.value;
  Weather? get weather => weatherNotifier.value;

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getCurrentWeather() async {
    _loading = true;
    Position position = await _getLocation();

    String latitude = position.latitude.toString();
    String longitude = position.longitude.toString();

    final result = await _getCurrentWeather.execute(latitude, longitude);

    result.fold(
      (error) => debugPrint(error.toString()),
      (sucess) => _weather = sucess,
    );

    _loading = false;
  }
}
