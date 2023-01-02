import 'package:flutter/material.dart';
import '../Component/form.dart';
import 'package:massenger/Pages/sign_up.dart';
import '../services/socket_service.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => Login();
}

class Login extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<FormState>();
  late String? phoneValue;
  late String? passwordValue;
  phoneOnSaved(String? value){
    phoneValue = value;
  }
  passwordOnSaved(String? value){
    passwordValue = value;
  }
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
                FormLoginContainer(
                  formkey: formkey,
                  phoneOnSaved : phoneOnSaved,
                  passwordOnSaved : passwordOnSaved,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingUpScreen()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
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
              onTap: () async {
                if(formkey.currentState!.validate()){
                  formkey.currentState!.save();
                  // Erfan
                  // use phoneValue, password and Login with Server
                /*  Map<String,String> message ={
                    "phone": phoneValue.toString(),
                    "password": passwordValue.toString(),
                  };
                  SocketService.setReceiverID("Server");
                  SocketService.sendMessage("LogIn",message.toString());
                  Navigator.of(context).pushNamed("/home");
                */
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
