import 'dart:async';

import 'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';
import 'package:massenger/chatmodel/chat_model.dart';
import 'package:massenger/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart'
;import 'package:connectivity_plus/connectivity_plus.dart';
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
  @override
  void initState() {
    super.initState();
    //checkLogin();
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