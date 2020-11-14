import 'package:flutter/material.dart';
import 'package:world_clock/services/timezone.dart';

class Choose_location extends StatefulWidget {
  @override
  _Choose_locationState createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<TimeZone> location = [
  TimeZone(location: 'Kolkata',flag: 'Kolkata.png',url: 'Asia/Kolkata'),
  TimeZone(location: 'Chicago',flag: 'chicago.png',url: 'America/Chicago'),
  TimeZone(location: 'Los_Angeles',flag: 'Los_Angeles.png',url: 'America/Los_Angeles'),
  TimeZone(location: 'Mexico_City',flag: 'Mexico_City.png',url: 'America/Mexico_City'),
  TimeZone(location: 'Panama',flag: 'Panama.png',url: 'America/Panama'),
  TimeZone(location: 'Bangkok',flag: 'Bangkok.png',url: 'Asia/Bangkok'),
  TimeZone(location: 'Dubai',flag: 'Dubai.png',url: 'Asia/Dubai'),
  TimeZone(location: 'Dhaka',flag: 'Dhaka.png',url: 'Asia/Dhaka'),
    TimeZone(location: 'Hong_Kong',flag: 'Hong_Kong.png',url: 'Asia/Hong_Kong'),
    TimeZone(location: 'Qatar',flag: 'Qatar.png',url: 'Asia/Qatar'),
    TimeZone(location: 'Singapore',flag: 'Singapore.png',url: 'Asia/Singapore'),
    TimeZone(location: 'Tokyo',flag: 'Tokyo.png',url: 'Asia/Tokyo'),
    TimeZone(location: 'London',flag: 'London.png',url: 'Europe/London'),
    TimeZone(location: 'Moscow',flag: 'Moscow.png',url: 'Europe/Moscow'),
    TimeZone(location: 'Berlin',flag: 'Berlin.png',url: 'Europe/Berlin'),
    TimeZone(location: 'Paris',flag: 'Paris.png',url: 'Europe/Paris'),
    TimeZone(location: 'Rome',flag: 'Rome.png',url: 'Europe/Rome'),
    TimeZone(location: 'Luxembourg',flag: 'Luxembourg.png',url: 'Europe/Luxembourg'),
    TimeZone(location: 'Canary',flag: 'Canary.png',url: 'Atlantic/Canary'),
    TimeZone(location: 'South_Georgia',flag: 'South_Georgia.png',url: 'Atlantic/South_Georgia'),
    TimeZone(location: 'Bermuda',flag: 'Bermuda.png',url: 'Atlantic/Bermuda'),
    TimeZone(location: 'Broken_Hill',flag: 'Broken_Hill.png',url: 'Australia/Broken_Hill'),
    TimeZone(location: 'Lord_Howe',flag: 'Lord_Howe.png',url: 'Australia/Lord_Howe'),
    TimeZone(location: 'Rarotonga',flag: 'Rarotonga.png',url: 'Pacific/Rarotonga'),
    TimeZone(location: 'Gambier',flag: 'Gambier.png',url: 'Pacific/Gambier'),
  ];

  void UpdateTime(index) async{
      TimeZone instance = location[index];
      await instance.getTime();

      //nevigate to homescreen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.person,
          size: 45.0,
        ),

        onPressed: (){
          Navigator.pushNamed(context, '/about');
        },
      ),
      body: ListView.builder(
          itemCount: location.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                      UpdateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
