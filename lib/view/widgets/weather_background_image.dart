import 'package:flutter/material.dart';

class WeatherBackGroundImage extends StatelessWidget {
  const WeatherBackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cloud.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}