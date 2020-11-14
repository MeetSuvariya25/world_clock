import 'package:flutter/material.dart';

class About_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'World-Clock',
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 2.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.blueGrey,
            ),
            Text(
              'An application that can tell you the time of different places all around the world. So I gave a name to this application "World-clock". '
                  'Until now, I only added a few places. In the next version of this application, I am going to add more places.'
                  'If you find any Bug or any error please let me know',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 50.0),
            Text(
              'Meet B. Suvariya',
              style: TextStyle(
                fontSize: 22.0,
                letterSpacing: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                ),
                SizedBox(width: 10.0),
                Text(
                  'meetsuvariya@gmail.com'
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
