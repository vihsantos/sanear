import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sanear/app/domain/entities/weather.dart';
import 'package:sanear/app/domain/use_cases/get_current_weather.dart';
import '../../data/models/sos_model.dart';

class SosController {
  final GetCurrentWeather _getCurrentWeather;

  SosController(this._getCurrentWeather);

  ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(true);
  ValueNotifier<Weather?> weatherNotifier = ValueNotifier<Weather?>(null);

  set _loading(bool load) => loadingNotifier.value = load;
  set _weather(Weather weather) => weatherNotifier.value = weather;

  bool get loading => loadingNotifier.value;
  Weather? get weather => weatherNotifier.value;

  Future<List<SosModel>> buscarSosModel() async {
    final String response =
        await rootBundle.loadString('assets/json/dados_sos.json');
    log(response);

    Iterable lista = jsonDecode(response);

    List<SosModel> dados =
        lista.map((model) => SosModel.fromMap(model)).toList();

    return dados;
  }

  Future<Position> _getLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return position;
    } else {
      throw Exception('Erro ao determinar Latitude e Longitude');
    }
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
