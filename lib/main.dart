
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/load.dart';
import 'package:weather_app/screens/location.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
  },
));

//second commit