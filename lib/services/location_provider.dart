// location_provider.dart
import 'package:flutter/material.dart';
import 'location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  String? _locationName;
  double ? _Latitude;
  double ? _Longitude;

  String? get locationName => _locationName;
  double? get Latitude => _Latitude;
  double? get Longtitude => _Longitude;

  Future<void> determinePosition() async {
    try {
      Position position = await _locationService.getCurrentPosition();
      _Latitude = position.latitude;
      _Longitude = position.latitude;
      print("Position fetched: Latitude = ${position.latitude}, Longitude = ${position.longitude}");
      
      _locationName = await _locationService.getAddressFromPosition(position);
      print("Location name: $_locationName");  // Print the location name for verification
      notifyListeners();
    } catch (e) {
      _locationName = "Unable to get location";
      print("Error fetching location: $e");  // Print any errors that occur
      notifyListeners();
    }
  }
}
