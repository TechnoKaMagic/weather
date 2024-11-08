import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/Bottomsectionrefact.dart';
import 'package:weather_app/Widgets.dart';
import 'package:weather_app/data/images.dart';
import 'package:weather_app/secrets/api.dart';
import 'package:weather_app/services/location_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false; // State variable to track search state
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  final TextEditingController _searchConroller = TextEditingController();
  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
    fetchWeather("alappuzha");
  }

  void fetchWeather(String cityName) {
    _wf.currentWeatherByCityName(cityName).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(_weather);
    print(_weather?.sunrise);

// Assuming _weather?.sunrise and _weather?.sunset are DateTime objects
    DateTime? sunrise = _weather?.sunrise;
    DateTime? sunset = _weather?.sunset;

    String formattedSunrise =
        sunrise != null ? DateFormat('h:mm a').format(sunrise) : "N/A";
    String formattedSunset =
        sunset != null ? DateFormat('h:mm a').format(sunset) : "N/A";

// Print formatted times
    print("Sunrise: $formattedSunrise");
    print("Sunset: $formattedSunset");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0, // Set elevation to 0 for a clean look
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              print("location searching");
              setState(() {
                _HomePageState();
              });
            },
            icon: const Icon(
              Icons.location_pin,
              size: 30,
              color: Colors.red,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return Text(
                  locationProvider.locationName ?? "Fetching location...",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                );
              },
            ),
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching; // Toggle the search state
                });
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Bg["${_weather?.weatherMain}"],
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.6),
              child: Image.asset(
                 WeatherIcons["${_weather?.weatherMain}"]  ?? WeatherIcons["Error"],
                height: 200,
                width: 200,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Container(
                height: 170,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    TextW(
                      text:
                          "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    TextW(
                      text: "${_weather?.areaName}",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    TextW(
                      text:
                          "${_weather?.weatherDescription}", // Adjust based on actual weather description
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    TextW(
                      text: DateFormat('hh:mm a')
                          .format(DateTime.now())
                          .toString(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.75),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomInfo(
                            img: tempHigh,
                            labelText: "Temp Max",
                            value:
                                "${_weather?.tempMax?.celsius?.toStringAsFixed(0)}\u00b0C" //?? " --°C",
                            ),
                        const SizedBox(width: 24),
                        BottomInfo(
                            img: tempLow,
                            labelText: "Temp Min",
                            value:
                                "${_weather?.tempMin?.celsius?.toStringAsFixed(0)}\u00b0C" //?? " --°C",
                            ),
                      ],
                    ),
                    const Divider(color: Colors.white, thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomInfo(
                            img: sun,
                            labelText: "Sunrise",
                            value:
                                formattedSunrise), // Example static time
                        SizedBox(width: 60),
                        BottomInfo(
                            img: moon,
                            labelText: "Sunset",
                            value: formattedSunset), // Example static time
                      ],
                    ),
                  ],
                ),
              ),
            ),
              // TextFormField appears here based on _isSearching
            if (_isSearching) // Show the TextFormField if searching
              Align(
                alignment: Alignment(0, -0.5), // Adjust alignment as needed
                child: Container(
                  width: 300, // Adjust width as needed
                  child: TextFormField(
                    controller: _searchConroller,
                    decoration: InputDecoration(
                      hintText: 'Search for a city',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        fetchWeather(value);
                        setState(() {
                          _isSearching = false;
                          _searchConroller.clear();
                        });
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}