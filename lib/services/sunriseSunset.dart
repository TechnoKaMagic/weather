import 'package:intl/intl.dart';

void main() {
  String sunriseStr = "2024-11-07 06:16:07.000";
  String sunsetStr = "2024-11-07 18:00:40.000";
  
  // Parse the strings into DateTime objects
  DateTime sunrise = DateTime.parse(sunriseStr);
  DateTime sunset = DateTime.parse(sunsetStr);
  
  // Format the DateTime objects
  String formattedSunrise = DateFormat('h:mm a').format(sunrise);
  String formattedSunset = DateFormat('h:mm a').format(sunset);
  
  // Print formatted times
  print("Sunrise: $formattedSunrise");
  print("Sunset: $formattedSunset");
}
