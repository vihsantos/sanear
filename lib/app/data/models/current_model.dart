import 'package:equatable/equatable.dart';
import 'package:sanear/app/data/models/condition_model.dart';
import 'package:sanear/app/domain/entities/current.dart';

class CurrentModel extends Equatable {
  const CurrentModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final ConditionModel condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"],
        condition: ConditionModel.fromJson(json["condition"]),
        windMph: json["wind_mph"].toDouble(),
        windKph: json["wind_kph"].toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"].toDouble(),
        pressureIn: json["pressure_in"].toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"].toDouble(),
        feelslikeF: json["feelslike_f"].toDouble(),
        visKm: json["vis_km"].toDouble(),
        visMiles: json["vis_miles"].toDouble(),
        uv: json["uv"].toDouble(),
        gustMph: json["gust_mph"].toDouble(),
        gustKph: json["gust_kph"].toDouble(),
      );

  Current toEntity() => Current(
        lastUpdatedEpoch: lastUpdatedEpoch,
        lastUpdated: lastUpdated,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition.toEntity(),
        windMph: windMph,
        windKph: windKph,
        windDegree: windDegree,
        windDir: windDir,
        pressureMb: pressureMb,
        pressureIn: pressureIn,
        precipMm: precipMm,
        precipIn: precipIn,
        humidity: humidity,
        cloud: cloud,
        feelslikeC: feelslikeC,
        feelslikeF: feelslikeF,
        visKm: visKm,
        visMiles: visMiles,
        uv: uv,
        gustMph: gustMph,
        gustKph: gustKph,
      );

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];
}
