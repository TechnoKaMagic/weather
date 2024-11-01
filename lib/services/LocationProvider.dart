import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/Location_Service.dart';

class Locationprovider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  final LocationService _locationService = LocationService();
  Placemark? _currentLocationName;
  Placemark? get currentLocation => _currentLocationName;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      _currentPosition = null;
      notifyListeners();
      return;
    }
    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
      notifyListeners();
      return;
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    print(_currentPosition);
    notifyListeners();


    _currentLocationName = await _locationService.getLocationName(_currentPosition);
    print(_currentLocationName);
  }

//ask  the permisstion

//get the location

//get the placemark
}
