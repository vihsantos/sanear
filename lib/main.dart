import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/controllers/home_controller.dart';
import 'package:sanear/injection.dart';
import 'app/presentation/pages/home/home.dart';

void main() async {
  Injection().init();

  runApp(MyApp());
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
      home: Home(
        homeController: locator<HomeController>(),
      ),
    );
  }
}
