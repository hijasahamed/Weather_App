import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/screens/weather_screen.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}