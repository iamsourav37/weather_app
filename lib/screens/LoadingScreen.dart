import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const String apiKey = '36f8986f4539ff824760c97bcfc35662';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  void getLocationData() async {
    Location location = Location();
    await location.getCuttentPosition();
    this.latitude = location.latitude;
    this.longitude = location.longitude;
    String url =
        "api.weatherstack.com/current?access_key=$apiKey&query=$latitude,$longitude";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: getLocationData,
          child: Text(
            "Get Location",
          ),
        ),
      ),
    );
  }
}
