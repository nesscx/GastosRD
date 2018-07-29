import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 64.0,
            child: Text(
              'J',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.0,
              ),
            ),
            backgroundColor: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          Text('José Gómez',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 140.0,
                child: Text('Full Name:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
              Text('José Guillermo Gómez Alcalá', style: TextStyle(fontSize: 18.0),),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
          Row(
            children: <Widget>[
              Container(
                width: 140.0,
                child: Text('Email:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              Text('jose4gga@gmail.com', style: TextStyle(fontSize: 18.0),),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
          Row(
            children: <Widget>[
              Container(
                width: 140.0,
                child: Text('Phone Number:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
              Text('+1 (809) 500-0000', style: TextStyle(fontSize: 18.0),),
            ],
          ),
        ],
      ),
    );
  }
}