import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Component/form.dart';
import '../Component/form_sign_up.dart';
import '../services/auth_services.dart';
class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<FormState>();
  late String userName;
  late String emailValue;
  late String passwordValue;
  storeUserData(Map userData) async  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.api_token', userData['api_token']);
    await prefs.setInt('user.user_id', userData['user_id']);
  }
/*  sendDataForSignUp() async{
    Map response = await (AuthService()).sendDataToLogin({"email": emailValue,"password": passwordValue});
    if(response['status' == 'success']){
      await storeUserData(response['data']);
      Navigator.pushReplacementNamed(context,"/home");
    }
    else{ // چک شود
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text( // 'E-mai or Password are not Correct'
              response['data'],
            ),
          ));
    }
  }*/
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
                FormSignUpContainer(
                  formkey: formkey,
                ),

                /*TextField(
                  controller: myTextFieldController,
                ),*/
              ],
            ),
            GestureDetector(
              onTap: () async{
                // print(myTextFieldController.text);
                if(formkey.currentState!.validate()){ // check
                  formkey.currentState!.save();
                  //await sendDataForLogin();
                }
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
                  "Sign Up",
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
