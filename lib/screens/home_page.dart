import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/Bottomsectionrefact.dart';
import 'package:weather_app/Widgets.dart';
import 'package:weather_app/data/images.dart';
import 'package:weather_app/secrets/api.dart';
import 'package:weather_app/services/LocationProvider.dart';
import 'package:weather_app/services/weatherService_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false; // State variable to track search state
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
    _wf.currentWeatherByCityName("Alappuzha").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0, // Set elevation to 0 for a clean look
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.location_pin, color: Colors.red, size: 30),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(  "Current Location",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
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
              icon: Icon(
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
              Bg["Rain"],
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.6),
              child: Image.asset(
                WeatherIcons["Clouds"],
                height: 150,
                width: 150,
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 170,
                width: 170,
                child: Column(
                  children: [
                    Consumer<WeatherServiceProvider>(
                      builder: (context, weatherProvider, child) {
                        return TextW(
                          text: "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C" ,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    TextW(
                      text: "${_weather?.weatherDescription}", // Adjust based on actual weather description
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    TextW(
                      text: DateFormat('hh:mm a').format(DateTime.now()).toString(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.75),
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
                        Consumer<WeatherServiceProvider>(
                          builder: (context, weatherProvider, child) {
                            return BottomInfo(
                              img: tempHigh,
                              labelText: "Temp Max",
                              value: "${ _weather?.tempMax?.celsius?.toStringAsFixed(0)}\u00b0C" //?? " --°C",
                            );
                          },
                        ),
                        SizedBox(width: 24),
                        Consumer<WeatherServiceProvider>(
                          builder: (context, weatherProvider, child) {
                            return BottomInfo(
                              img: tempLow,
                              labelText: "Temp Min",
                              value: "${ _weather?.tempMin?.celsius?.toStringAsFixed(0)}\u00b0C" //?? " --°C",
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(color: Colors.white, thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomInfo(img: sun, labelText: "Sunrise", value: "6:30 AM"), // Example static time
                        SizedBox(width: 60),
                        BottomInfo(img: moon, labelText: "Sunset", value: "7:30 PM"), // Example static time
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
                    decoration: InputDecoration(
                      hintText: 'Search for a city',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
