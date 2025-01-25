import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeatherController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var cityName = ''.obs;
  var temperature = ''.obs;
  var description = ''.obs;
  var iconCode = ''.obs;

  final String _apiKey = '0cec6d7096cce671bea2d7242ccd0ed5';

  Future<void> fetchWeather(String city) async {
    isLoading.value = true;
    errorMessage.value = '';

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        cityName.value = data['name'];
        temperature.value = '${data['main']['temp']} °C';
        description.value = data['weather'][0]['description'];
        iconCode.value = data['weather'][0]['icon'];
      } else {
        errorMessage.value = 'City not found. Please try again.';
      }
    } catch (e) {
      errorMessage.value =
          'Failed to fetch data. Please check your internet connection.';
    } finally {
      isLoading.value = false;
    }
  }

  Widget _buildWeatherIcon() {
    if (iconCode.isEmpty) return Icon(Icons.cloud, size: 100, color: Colors.white);
    final iconUrl = 'https://openweathermap.org/img/wn/${iconCode.value}@2x.png';
    return Image.network(
      iconUrl,
      width: 100,
      height: 100,
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.error, size: 100, color: Colors.red),
    );
  }

  Widget buildWeatherInfo() {
    if (isLoading.value) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          errorMessage.value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (cityName.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildWeatherIcon(),
          Text(
            cityName.value,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            temperature.value,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            description.value,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white70),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }
}