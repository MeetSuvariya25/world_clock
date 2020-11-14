import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class TimeZone{

    String location;  //location name for ui
    String time;  //time for location
    String flag; //url for assets icon
    String url; //location url  for api endpoint
    bool isDaytime; //true for day false for night

    TimeZone({this.location,this.flag,this.url});

    Future<void> getTime() async {

      try{
        //make request
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data=jsonDecode(response.body);
        //print(data);

        //get the properties
        String datetime=data['datetime'];
        String offset=data['utc_offset'].substring(1,3);
        String offset2=data['utc_offset'].substring(4,6);
        //print(datetime);
        //print(offset);

        //make DatTime object
        DateTime now = DateTime.parse(datetime);
        now =now.add(Duration(hours: int.parse(offset)));
        now =now.add(Duration(minutes: int.parse(offset2)));

        //set the time propertiy
        isDaytime= now.hour > 6 && now.hour < 20 ? true : false;
        time=DateFormat.jm().format(now);

      }
      catch(e){
        print('cought an error: $e');
        time='Could not get time data';
      }


    }
}