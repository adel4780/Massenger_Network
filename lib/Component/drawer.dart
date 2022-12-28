import 'package:flutter/material.dart';
import 'package:massenger/Pages/setting_screen.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../Pages/channel_screen.dart';
import '../Pages/contact.dart';
import '../Pages/group_screen.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
class DrawerLayoutBar extends StatefulWidget {
  const DrawerLayoutBar({Key? key}) : super(key: key);

  @override
  State<DrawerLayoutBar> createState() => _DrawerLayoutBarState();
}

class _DrawerLayoutBarState extends State<DrawerLayoutBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              decoration: const BoxDecoration(
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
                children: const [
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
              leading: const Icon(Icons.group),
              title: const Text("New Group"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => GroupScreen()));
              }
          ),
          ListTile(
              leading: const Icon(Icons.speaker),
              title: const Text("New Channel"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ContactScreen()));
              }
          ),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Contacts"),
              onTap: () { // مخاطبین بساز
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelScreen()));
              }
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => SettingScreen()));
              }
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {

              }
          ),
        ],
      ),
    );
  }
}

Drawer buildDrawerLayout(BuildContext context){
  return Drawer(
    child: SingleChildScrollView(
      child: Container(
      child: ListView(
        children: [
          DrawerHeader(
           // padding: EdgeInsets.zero,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1976D2),
                      //Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: const [
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
            leading: const Icon(Icons.group),
            title: const Text("New Group"),
            onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => GroupScreen()));
              }
          ),
          ListTile(
            leading: const Icon(Icons.speaker),
            title: const Text("New Channel"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context) => const ContactScreen()));
            }
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Contacts"),
            onTap: () { // مخاطبین بساز
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelScreen()));
              }
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context) => SettingScreen()));
            }
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {

              }
            ),
          ],
        ),
      ),
    ),
  );
}