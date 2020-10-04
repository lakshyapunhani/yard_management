import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yard_management/common/SessionManager.dart';
import 'package:yard_management/ui/Auth/LoginScreen.dart';
import 'package:yard_management/ui/SelectProfileScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  startTime() async {
    return Timer(
        Duration(seconds: splashDuration),
            () async {
          if (await isLoggedIn() == true) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SelectProfileScreen()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        }
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset('assets/images/ic_launcher.png'))
    );
  }
}