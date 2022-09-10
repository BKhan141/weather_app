import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:weather_app/utils/strings.dart';
import '../models/CurrentWeatherModel.dart';
Future getCurrentWeather(lat,long)async{
  var link="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var response=await http.get(Uri.parse(link));
  if(response.statusCode==200){
    var data=currentWeatherModelFromJson(response.body.toString());
    return data;
  }
}
List<dynamic> list=[];
getHourlyWeather(lat,long)async{
  var hourlyLink="https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var response=await http.get(Uri.parse(hourlyLink));
  var data=jsonDecode(response.body.toString());
  if(response.statusCode==200){
    list=data['list'];
    return list;

  }
}