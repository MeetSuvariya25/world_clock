import 'package:flutter/material.dart';
import 'package:world_clock/pages/Choose_Location.dart';
import 'package:world_clock/pages/Home.dart';
import 'package:world_clock/pages/Loding.dart';
import 'package:world_clock/pages/About_us.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loding(),
      '/home':(context) =>Home(),
      '/location':(context)=>Choose_location(),
      '/about':(context)=>About_us(),
    },
  ));
}

