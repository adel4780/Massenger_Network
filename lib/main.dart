import 'package:flutter/material.dart';
import 'package:massenger/Pages/create_chatscreen.dart';
import 'package:massenger/Pages/setting_screen.dart';

import 'package:massenger/massenger_home.dart';
import 'package:massenger/Pages/splashscreen.dart';
import 'Pages/loginscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white, // درست کن
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",//"/splash_screen"
      routes: {
       // "/" :(context) =>Directionality(textDirection: TextDirection.ltr,child: SocketIoScreen(),),
        "/" :(context) =>const Directionality(textDirection: TextDirection.ltr,child: SplashScreen(),),
        "/login" :(context) =>const Directionality(textDirection: TextDirection.ltr,child: LoginScreen(),),
        "/home" : (context) => const Directionality(textDirection: TextDirection.ltr,child: MassengerHome(),),
      },
    );
  }
}
