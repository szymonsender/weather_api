import 'package:flutter/material.dart';


class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.time,
  });

  final double temperature;
  final String city;
  final String time;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temperature'] + 0.0,
        city = json['request']['query'],
        time = json['location']['localtime'];
}
