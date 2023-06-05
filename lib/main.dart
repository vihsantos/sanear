import 'package:flutter/material.dart';
import 'package:sanear/injection.dart';
import 'app/presentation/pages/home/home.dart';

void main() async {
  Injection().init();

  // chamada teste weather
  // SosController sosController = locator<SosController>();
  // await sosController.getCurrentWeather();
  // if (!sosController.loading) {
  //   log(sosController.weather.toString());
  // }

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final locator = Injection().locator;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanear',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
