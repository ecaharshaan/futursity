import 'dart:convert';

import 'package:futursity/model/model_thanks.dart';
import 'package:futursity/model/model_welcome.dart';
import 'package:http/http.dart' as http;

Future<CouseFirst> fetchData() async {
  const url = "https://futursity.com/course/api/top_courses";
  final response = await http
      .get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CouseFirst.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');

  }
}Future<CourseSecond> getData() async {
  const url = "https://futursity.com/course/api/categories"; 
  final response = await http
      .get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CourseSecond.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');

  }
}
