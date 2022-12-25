import 'package:flutter/material.dart';
import 'package:massenger/Pages/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Pages/channel_screen.dart';
import '../Pages/contact.dart';
import '../Pages/group_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Drawer buildDrawerLayout(BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end:  Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      leading: CircleAvatar(
                      backgroundColor: Colors.grey, // image profile
                      ),
                      title: Text("username",style: TextStyle(color: Colors.white),),
                    ),

                  ),

                ],
              ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text("New Group"),
          onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context) => GroupScreen()));
            }
        ),
        ListTile(
          leading: Icon(Icons.speaker),
          title: Text("New Channel"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context) => ContactScreen()));
          }
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Contacts"),
          onTap: () { // مخاطبین بساز
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelScreen()));
            }
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context) => SettingScreen()));
          }
        ),
        ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('user.api_token');
              Navigator.of(context).pushReplacementNamed('/login');
            }
        ),
      ],
    ),
  );
}