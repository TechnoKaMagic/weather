import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/location_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => LocationProvider()),
 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weater App',
        theme: ThemeData(
      
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          elevation: 0,
          ),
      
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomePage(),
      ),
    );
  }
}