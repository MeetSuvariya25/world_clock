import 'package:flutter/material.dart';
import 'package:world_clock/services/timezone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loding extends StatefulWidget {
  @override
  _lodingState createState() => _lodingState();
}

class _lodingState extends State<loding> {

  void setTime() async{
    TimeZone instance=TimeZone(location: 'Kolkata',flag: 'Kolkata.png',url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });
  }


  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
