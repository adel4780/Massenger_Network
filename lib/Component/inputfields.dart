import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final String? Function(String?) validator;
  final onSaved;
  InputFieldArea({
    super.key,
    required this.hint,
    required this.obscure,
    required this.icon,
    required this.validator,
    required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: validator,
        onSaved: this.onSaved,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white30,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorStyle: const TextStyle(color: Colors.amber),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
            contentPadding:
                const EdgeInsets.only(top: 15, right: 0, bottom: 20, left: 5)
        ),
      ),
    );
  }
}
