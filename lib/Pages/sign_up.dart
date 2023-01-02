import 'package:flutter/material.dart';
import '../Component/form_sign_up.dart';
import '../services/socket_service.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<FormState>();
  late String? email;
  late String? phoneValue;
  late String? passwordValue;
  emailOnSaved(String? value){
    email = value;
  }
  phoneOnSaved(String? value){
    phoneValue = value;
  }
  passwordOnSaved(String? value){
    passwordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldkey, // چک شود
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
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
                height: page.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/login.png"),
                      repeat: ImageRepeat.repeat),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormSignUpContainer(
                  formkey: formkey,
                  emailOnSaved: emailOnSaved,
                  phoneOnSaved: phoneOnSaved,
                  passwordOnSaved: passwordOnSaved,
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
              if(formkey.currentState!.validate()){
                formkey.currentState!.save();
                // Erfan
                // use email, phone, password for sign up
                Map<String,String> message ={
                  "email": email.toString(),
                  "phone": phoneValue.toString(),
                  "password": passwordValue.toString(),
                };
                SocketService.setReceiverID("Server");
                SocketService.sendMessage("SignUp",message.toString());
                Navigator.of(context).pushNamed("/home");
              }

              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: 230,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
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
