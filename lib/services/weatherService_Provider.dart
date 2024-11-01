import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_responseModel.dart';
import 'package:weather_app/secrets/api.dart';

class WeatherServiceProvider extends ChangeNotifier{

weatherModel?_weather;

weatherModel ? get weather=> _weather;

bool _isLoading =false;
bool get isLoading => _isLoading;

String _error ="";
String get error => _error;

Future <void> fetchWeatherDataByCity(String city )async{

_isLoading = true;
_error = "";

try{
  final apiUrl = "${APIEndpoints().baseUrl}${city}&appid=${APIEndpoints().apikey}";
  print(apiUrl);
  final response = await http.get(Uri.parse(apiUrl));
if (response.statusCode==200){
  final data =jsonDecode(response.body);
  print(data);

  _weather=weatherModel.fromJson(data);
  notifyListeners();


}else {
  _error="Faild to Load data";

}

}catch (e){
    _error="Faild to Connect";

}finally{
  _isLoading = false;
  notifyListeners();
  
}
}
}
