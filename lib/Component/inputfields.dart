import 'package:flutter/material.dart';
class InputFieldArea extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final String? Function(String?) validator;

  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();
  InputFieldArea({required this.hint,required this.obscure,required this.icon,required this.validator, });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: validator,
        obscureText: obscure,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white30,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorStyle: TextStyle(color: Colors.amber),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
          contentPadding: EdgeInsets.only(top: 15, right: 0, bottom: 20, left: 5)
        ),
      ),
    );
  }
}

