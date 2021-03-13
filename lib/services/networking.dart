import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url1;
  final String url2;

  NetworkHelper({@required this.url1, @required this.url2});

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.http(url1, url2),
    );
    if (response.statusCode == 200) {
      print("Status Code : ${response.statusCode}");
      print(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      print(jsonDecode(response.body));
    }
  }
}
