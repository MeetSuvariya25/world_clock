import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;
    print(data);


    //background
    String bgImg=data['isDaytime'] ? 'Day.jpg' : 'Night.jpg';
    Color bgcol=data['isDaytime'] ? Colors.deepOrange : Colors.indigo[700];
    Color fcol=data['isDaytime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: bgcol,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120 ,0 ,0 ),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data={
                         'time' : result['time'],
                         'location' :result['location'],
                         'isDaytime': result['isDaytime'],
                         'flag' : result['flag'],
                       };
                     });
                    },
                    icon: Icon(
                     Icons.edit_location,
                      color: fcol,
                    ),

                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: fcol,
                        ),
                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: fcol,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: fcol,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
