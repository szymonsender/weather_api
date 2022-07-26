import 'package:dio/dio.dart';
import 'package:weather_api/data/weather_data_source.dart';
import 'package:weather_api/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(WeatherRemoteDataSource weatherRemoteDataSource);

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherstack.com/current?access_key=53d247edd784a7cf8c3e48ca15db2f1a&query=$city');
    final responseData = response.data;
    if (responseData == null) {
      return null;
    }
    final name = responseData['request']['query'] as String;
    final temperature =
        (responseData['current']['temperature'] + 0.0) as double;
    final time = responseData['location']['localtime'] as String;

    return WeatherModel(temperature: temperature, city: name, time: time);
  }
}
