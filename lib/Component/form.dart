import 'package:flutter/material.dart';
import 'package:massenger/Component/inputfields.dart';

class FormLoginContainer extends StatelessWidget {
  final formkey;
  final  phoneOnSaved;
  final passwordOnSaved;
  FormLoginContainer({super.key, required this.formkey, required this.phoneOnSaved, required this.passwordOnSaved});
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
                  hint: 'Phone: 09...', // Phone
                  obscure: false,
                  icon: Icons.call,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter a Phone Number";
                    }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                      return "Please Enter a Valid Phone Number";
                    }
                  },
                  onSaved : phoneOnSaved
                ),
                InputFieldArea(
                  hint: 'password',
                  obscure: true,
                  icon: Icons.key,
                  validator: (value) {
                    if (value!.toString().length < 5) {
                      // mistake
                      return "Password > 5 character";
                    } else {
                      return null;
                    }
                  },
                  onSaved : passwordOnSaved
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
