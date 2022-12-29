import 'package:flutter/material.dart';
import 'package:massenger/Component/inputfields.dart';
import 'package:validators/validators.dart';

class FormLoginContainer extends StatelessWidget {
  final formkey;
  const FormLoginContainer({super.key, required this.formkey});
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
                  hint: 'e-mail', // Phone
                  obscure: false,
                  icon: Icons.person_outline,
                  validator: (value) {
                    // mistake درستش کن
                    if (!isEmail(value!)) {
                      return "E-mail is not valid";
                    } else {
                      return null;
                    }
                  },
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
