import 'package:flutter/material.dart';
import 'package:futursity/screens/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/images/trogon.jpg',
          height: 40,
          width: 80,),
          backgroundColor: Colors.white,
          
        ),
        body:const HomePage1() ,
      ),);
  }
}

