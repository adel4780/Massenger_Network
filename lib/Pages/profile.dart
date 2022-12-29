import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:massenger/ProfileComponent/page/profile_page.dart';
import 'package:massenger/ProfileComponent/themes.dart';
import 'package:massenger/ProfileComponent/utils/user_preferences.dart';

class ProfileScreen extends StatelessWidget {
  static final String title = 'User Profile';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
