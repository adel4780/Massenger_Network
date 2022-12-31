import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text("Profile",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
    leading: BackButton(
        color: Colors.grey,
        onPressed: () {
          Navigator.pop(context);
        }),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
