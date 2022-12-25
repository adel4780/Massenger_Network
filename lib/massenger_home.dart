import 'dart:io';

import 'package:flutter/material.dart';
import 'package:massenger/Pages/all_screen.dart';
import 'package:massenger/Pages/group_screen.dart';
import 'package:massenger/Pages/channel_screen.dart';
import 'package:massenger/Pages/create_chatscreen.dart';
import 'package:massenger/Pages/setting_screen.dart';
import 'Component/drawer.dart';

class MassengerHome extends StatefulWidget {
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
    tabController = new TabController(initialIndex: 0, length: 3, vsync: this);

    SliverAppBar mainAppBar = SliverAppBar(
      // search, setting
      title: Text("Massenger"),
      pinned: true,
      // pin appBar on Top
      floating: true,
      automaticallyImplyLeading: false,
      elevation: 5,
      // shadow
      actions: [
        GestureDetector(
          child: Icon(Icons.search),
          onTap: () {
            setState(() {
              _currentAppBar = 'searchAppBar';
            });
          },
        ), //->
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
      ],
      bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white, // Line of Tab
          tabs: [
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
      title: TextField(
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
        child: Padding(
            padding: const EdgeInsets.only(right: 12),
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
              title: Text("Do You Want to Exit?"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),//exit(0),
                  child: Text(
                    'Yes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
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
      child: Scaffold(
        drawer: buildDrawerLayout(context),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[Container(child: appBarList[_currentAppBar])];
          },
          body: _currentAppBar == 'mainAppBar'
              ? TabBarView(
                  controller: tabController,
                  children: [
                    AllScreen(),
                    GroupScreen(),
                    ChannelScreen(),
                  ],
                )
              : Center(
                  child: Text('Search'),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateChatScreen()),

            );
          },
        ),
      ),
      onWillPop:willpop,
    );
  }
}