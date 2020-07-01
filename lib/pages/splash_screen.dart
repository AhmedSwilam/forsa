import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forsa/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
               child: Image.asset('assets/facebook1.png'),
            ),
           Text(
            'Welcome to Forsa World',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}
