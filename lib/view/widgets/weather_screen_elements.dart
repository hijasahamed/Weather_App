import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/viewmodel/weather_controller.dart';

class WeatherScreenElements extends StatelessWidget {
  const WeatherScreenElements({
    super.key,
    required this.weatherController,
  });

  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 7,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: weatherController.cityController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  labelStyle: TextStyle(color: Colors.white),                        
                  prefixIcon: Icon(Icons.location_city, color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withAlpha(52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                weatherController
                    .fetchWeather(weatherController.cityController.text.trim());
                weatherController.cityController.clear();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Get Weather'),
            ),
            SizedBox(height: 32),
            Obx(() => weatherController.buildWeatherInfo()),
          ],
        ),
      ),
    );
  }
}