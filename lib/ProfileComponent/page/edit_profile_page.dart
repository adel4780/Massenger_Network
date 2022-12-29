import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:massenger/ProfileComponent/page/profile_page.dart';
import 'package:path/path.dart';
import 'package:massenger/ProfileComponent/model/user.dart';
import 'package:massenger/ProfileComponent/utils/user_preferences.dart';
import 'package:massenger/ProfileComponent/widget/appbar_widget.dart';
import 'package:massenger/ProfileComponent/widget/button_widget.dart';
import 'package:massenger/ProfileComponent/widget/profile_widget.dart';
import 'package:massenger/ProfileComponent/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) =>
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                appBar: buildAppBar(context),
                body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  physics: BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                      imagePath: user.imagePath,
                      isEdit: true,
                      //Erfan Choose profile Picture
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Full Name',
                      text: user.name,
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Email',
                      text: user.email,
                      onChanged: (email) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Bio',
                      text: user.about,
                      maxLines: 5,
                      onChanged: (about) {},
                    ),
                    const SizedBox(height: 24),
                    Center(child: buildSaveButton(context)),
                  ],
                ),
              ),
        ),
      );
  Widget buildSaveButton(BuildContext context) => ButtonWidget(
    text: 'Save',
    onClicked: () {
      // Erfan
      // Edit Changed Information
      Navigator.pop(context);
      Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage()));
    },
  );
}
