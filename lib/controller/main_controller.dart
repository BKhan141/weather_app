import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/api_services.dart';
class MainController extends GetxController{
  var currentWeatherData;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
var hourlyWeatherData;
var isDark=false.obs;
var isLoaded=false.obs;
  @override
  void onInit()async{
    await getUserLocation();
    hourlyWeatherData=getHourlyWeather(latitude.value,longitude.value);
    currentWeatherData=getCurrentWeather(latitude.value,longitude.value);
    super.onInit();
  }
  changeTheme(){
    isDark.value=!isDark.value;
    Get.changeThemeMode(isDark.value?ThemeMode.dark:ThemeMode.light);
  }
  getUserLocation()async{
    bool isLocationEnabled;

    LocationPermission userPermission;
    isLocationEnabled= await Geolocator.isLocationServiceEnabled();
    if(!isLocationEnabled){
      return Future.error("Location is not enabled");
    }
    userPermission=await Geolocator.checkPermission();
    if(userPermission==LocationPermission.deniedForever){
      return Future.error("Permission is denied forever");
    } else if(userPermission==LocationPermission.denied){
      userPermission= await Geolocator.requestPermission();
    }
    if(userPermission==LocationPermission.denied){
      return Future.error("Location is denied");
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
      latitude.value=value.latitude;
      longitude.value=value.longitude;
      isLoaded.value=true;

    });
  }
}
