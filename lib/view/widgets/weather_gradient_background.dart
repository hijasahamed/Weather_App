import 'package:flutter/material.dart';

class WeatherGradientBackground extends StatelessWidget {
  const WeatherGradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black54, Colors.black26],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}