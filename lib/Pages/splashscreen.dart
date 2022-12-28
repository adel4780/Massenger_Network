import 'dart:async';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  navigationToLogin(){
    Navigator.of(context).pushNamed("/login");
  }
  navigationToHome(){
    Navigator.of(context).pushNamed("/home");
  }
  startTime(){
    var _duration = Duration(seconds: 5);
    return new Timer(_duration, (){Navigator.of(context).pushNamed("/login");});
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200, // حجم عکس کم شود
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/logo.jpg"),
                  ),
                ),
              ),
              Text("Massenger",style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),), // اسمش ؟
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Align (
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}