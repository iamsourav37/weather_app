import 'package:flutter/material.dart';
import 'package:weather_app/screens/LoadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
