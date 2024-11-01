import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Bottomsectionrefact.dart';
import 'package:weather_app/Widgets.dart';
import 'package:weather_app/data/images.dart';
import 'package:weather_app/services/LocationProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false; // State variable to track search state

@override
void initState(){
    Provider.of<Locationprovider>(context,listen: false).determinePosition();
    super.initState();
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
            Text(
              "Current Location",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Good Morning",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white),
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
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    TextW(text: "21 C", fontSize: 30, fontWeight: FontWeight.bold,),
                    TextW(text: "Clouds", fontSize: 28, fontWeight: FontWeight.bold,),
                    TextW(text: DateFormat('hh:mm a')
                        .format(DateTime.now())
                        .toString(), fontSize: 20, fontWeight: FontWeight.bold,)
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
                        BottomInfo(
                            img: tempHigh,
                            labelText: "Temp Max",
                            value: "10" // Placeholder value
                        ),
                        SizedBox(width: 24),
                        BottomInfo(
                            img: tempLow, labelText: "Temp Min", value: "20°C"),
                      ],
                    ),
                    Divider(color: Colors.white, thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottomInfo(img: sun, labelText: "Sunrise", value: "31°C"),
                        SizedBox(width: 60),
                        BottomInfo(img: moon, labelText: "Sunset", value: "20°C")
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
