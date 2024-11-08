 

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
 
class GetLOcation {
 
  Future<String> getCurrentCity(String cityName)async{
      LocationPermission permission =await Geolocator.checkPermission();
      if(permission ==LocationPermission.denied){
        permission=await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition();
      LocationAccuracy.high;

      List<Placemark>placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);

      String? City =placemarks[0].locality;

      return City ?? "";
  }
 }