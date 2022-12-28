import 'dart:convert';

import'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';
import 'package:massenger/chatmodel/chat_model.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../Component/form.dart';
import 'package:http/http.dart' as http;
import 'package:massenger/services/auth_services.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => Login();
}
class Login extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<FormState>();
  late String emailValue;
  late String passwordValue;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldkey, // چک شود
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent, // تغییر
              Colors.black
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Opacity(
                opacity: 0.1,
                child: Container(
                width: page.width,
                height:page.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/login.png"),
                      repeat: ImageRepeat.repeat
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormLoginContainer(
                    formkey: formkey,
                ),
                ElevatedButton(
                    onPressed: () { // درستش کن

                    },
                    child: Text(
                      "Sign Up", style: TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async{
                  Navigator.of(context).pushNamed("/home");
              },
              child:Container(
                margin: EdgeInsets.only(bottom: 30),
                width: 230,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
