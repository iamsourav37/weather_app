import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({@required this.url});

  Future<void> getData() async {
    http.Response response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "albums"));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print(response.statusCode);
    }
  }
}
