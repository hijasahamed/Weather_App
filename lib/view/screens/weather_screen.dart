import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/widgets/weather_background_image.dart';
import 'package:weather_app/view/widgets/weather_gradient_background.dart';
import 'package:weather_app/view/widgets/weather_screen_elements.dart';
import 'package:weather_app/viewmodel/weather_controller.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 15,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          WeatherBackGroundImage(),
          WeatherGradientBackground(),
          WeatherScreenElements(weatherController: weatherController),
        ],
      ),
    );
  }
}