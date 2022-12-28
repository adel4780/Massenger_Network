import 'dart:io';

import 'package:flutter/material.dart';
import 'package:massenger/Pages/all_screen.dart';
import 'package:massenger/Pages/group_screen.dart';
import 'package:massenger/Pages/channel_screen.dart';
import 'package:massenger/Pages/create_chatscreen.dart';
import 'package:massenger/Pages/setting_screen.dart';
import 'Component/drawer.dart';
import 'Pages/contact.dart';

class MassengerHome extends StatefulWidget {
  const MassengerHome({super.key});

  @override
  State<MassengerHome> createState() => _MassengerHomeState();
}

class _MassengerHomeState extends State<MassengerHome>
    with SingleTickerProviderStateMixin {
  //**/
  late TabController tabController;
  late Map<String, SliverAppBar> appBarList;
  String _currentAppBar = 'mainAppBar';

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    SliverAppBar mainAppBar = SliverAppBar(
      // search, setting
      title: const Text("Massenger"),
      pinned: true,
      // pin appBar on Top
      floating: true,
      automaticallyImplyLeading: false,
      elevation: 5,
      // shadow
      actions: [
        GestureDetector(
          child: const Icon(Icons.search),
          onTap: () {
            setState(() {
              _currentAppBar = 'searchAppBar';
            });
          },
        ), //->
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
      ],
      bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white, // Line of Tab
          tabs: const [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Group",
            ),
            Tab(
              text: "Channel",
            ),
          ]),
    );
    SliverAppBar searchAppBar = SliverAppBar(
      // search, setting
      title: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search...",
        ),
      ),
      pinned: true,
      // pin appBar on Top ->
      elevation: 5,
      // shadow
      backgroundColor: Colors.white,
      leading: GestureDetector(
        child: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        // search color
        onTap: () {
          setState(() {
            _currentAppBar = 'mainAppBar';
          });
        },
      ),
    );
    appBarList = <String, SliverAppBar>{
      'mainAppBar': mainAppBar,
      'searchAppBar': searchAppBar,
    };
  }
  Future<bool> willpop() async{
    return  (await showDialog (
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: AlertDialog(
              title: const Text("Do You Want to Exit?"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),//exit(0),
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                )
              ],
            ),
          );
        },
    )) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:willpop,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors:[
                        Colors.blueAccent,
                        Colors.blueAccent,
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const GroupScreen()));
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const ChannelScreen()));
                  }
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingScreen()));
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
        ),//->
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[Container(child: appBarList[_currentAppBar])];
          },
          body: _currentAppBar == 'mainAppBar'
              ? TabBarView(
                  controller: tabController,
                  children: const [
                    AllScreen(),
                    GroupScreen(),
                    ChannelScreen(),
                  ],
                )
              : const Center(
                  child: Text('Search'),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateChatScreen()),
            );
          },
        ),

      ),
    );
  }
}
