 import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

  Future<Placemark?> getLocationName(Position?position)async{
    if(position != null){
      try{
        final Placemark = await placemarkFromCoordinates(position.latitude,position.longitude);
        if(Placemark.isNotEmpty){
          return Placemark[0];
        }
      }catch(e){
        print("error fecheing location name");
      }
      return null;
    }
    print(getLocationName);
  }
 }