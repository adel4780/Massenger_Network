import 'dart:io';
import 'package:flutter/material.dart';
import 'package:massenger/Group/CreateChannel.dart';
import 'package:massenger/Pages/all_screen.dart';
import 'package:massenger/Pages/group_screen.dart';
import 'package:massenger/Pages/channel_screen.dart';
import 'package:massenger/Pages/setting_screen.dart';
import 'package:massenger/search.dart';
import 'Group/CreateGroup.dart';
import 'Group/SelectContact.dart';
import 'ProfileComponent/page/profile_page.dart';

class MassengerHome extends StatefulWidget {
  const MassengerHome({super.key});

  @override
  State<MassengerHome> createState() => _MassengerHomeState();
}

class _MassengerHomeState extends State<MassengerHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late SliverAppBar mainAppBar;
  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    mainAppBar = SliverAppBar(
      // search, setting
      title: Text("Massenger"),
      pinned: true,
      // pin appBar on Top
      floating: true,
      automaticallyImplyLeading: true,
      elevation: 5,
      // shadow
      actions: [
        GestureDetector(
          child: const Icon(Icons.search),
          onTap: () {
            // Navigator
            showSearch(
                context: context,
                delegate: SearchScreen(),
            );
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
  }

  Future<bool> willpop() async {
    return (await showDialog(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: AlertDialog(
                title: const Text("Do You Want to Exit?"),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () => exit(0), //exit(0),
                    child: const Text(
                      'Yes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willpop,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Stack(
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("img/person.png"),
                            radius: 30,// image profile
                          ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:Text(
                          //Erfan => username
                          // adel hanooz balad nistam authoration konam bayad server kamel dashte basham :) ishalla farda
                          "username",
                          style: TextStyle(color: Colors.white, fontSize: 15),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  }),
              ListTile(
                  leading: const Icon(Icons.campaign_outlined),
                  title: const Text("New Channel"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateChannel()));
                  }),
              ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: const Text("Contacts"),
                  onTap: () {
                    // مخاطبین بساز
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectContact()));
                  }),
              ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: const Text("Profile"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()));
                  }),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()));
                  }),
              ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () async {
                    // Erfan
                    //adel az TA ha beporsim nemidoonam ino
                    // LogOut az Account
                  }),
            ],
          ),
        ), //->
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[Container(child: mainAppBar)];
          },
          body: TabBarView(
                  controller: tabController,
                  children:  [
                    AllScreen(),
                    GroupScreen(),
                    ChannelScreen(),
                  ],
                )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectContact()),
            );
          },
        ),
      ),
    );
  }
}
class GenericSearch<T>{

}