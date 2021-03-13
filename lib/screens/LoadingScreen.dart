import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const String apiKey = '4c15e5152554d721a2d364658112e7cf';

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
    var url1 = "api.openweathermap.org";
    var url2 =
        "/data/2.5/weather?lat={$latitude}&lon={$longitude}&appid={$apiKey}";
    NetworkHelper networkHelper = NetworkHelper(url1: url1, url2: url2);
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
