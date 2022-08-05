import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Image.network(
              "http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png"),
        ),
        const SizedBox(height: 10),
        Text(
          "Weather: ${weatherModel.weather.first.description}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Current Temp: ${weatherModel.main.temp}°C',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Feels Like: ${weatherModel.main.feelsLike}°C',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Max Temp: ${weatherModel.main.tempMax}°C',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Min Temp: ${weatherModel.main.tempMin}°C',
          style: const TextStyle(fontSize: 18),
        ),
      ]),
    );
  }
}
