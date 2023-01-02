import 'package:flutter/material.dart';
import 'package:massenger/Component/inputfields.dart';
import 'package:validators/validators.dart';

class FormSignUpContainer extends StatelessWidget {
  final formkey;
  final  emailOnSaved;
  final  phoneOnSaved;
  final passwordOnSaved;
  const FormSignUpContainer({
    super.key,
    required this.formkey, required this.emailOnSaved, required this.phoneOnSaved,required this.passwordOnSaved,

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                InputFieldArea(
                  hint: 'e-mail',
                  obscure: false,
                  icon: Icons.mail,
                  validator: (value) {
                    // mistake درستش کن
                    if (!isEmail(value!)) {
                      return "E-mail is not valid";
                    } else {
                      return null;
                    }
                  },
                  onSaved: emailOnSaved,
                ),
                InputFieldArea(
                  hint: 'Phone: 09...',
                  obscure: false,
                  icon: Icons.phone,
                  validator: (value) {
                    // mistake درستش کن
                    if(value!.isEmpty){
                      return "Please Enter a Phone Number";
                    }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                      return "Please Enter a Valid Phone Number";
                    }
                  },
                  onSaved: phoneOnSaved,
                ),
                InputFieldArea(
                  hint: 'password',
                  obscure: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value!.toString().length < 5) {
                      // mistake
                      return "Password > 5 character";
                    } else {
                      return null;
                    }
                  },
                  onSaved: passwordOnSaved,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
