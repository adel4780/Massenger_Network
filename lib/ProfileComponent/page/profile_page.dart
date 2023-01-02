import 'package:flutter/material.dart';
import 'package:massenger/ProfileComponent/model/user.dart';
import 'package:massenger/ProfileComponent/page/edit_profile_page.dart';
import 'package:massenger/ProfileComponent/widget/appbar_widget.dart';
import 'package:massenger/ProfileComponent/widget/button_widget.dart';
import 'package:massenger/ProfileComponent/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildEditButton()),
            ],
          ),
        );
  }
  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            user.phone,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          )
        ],
      );

  Widget buildEditButton() => ButtonWidget(
        text: 'Edit',
        onClicked: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>EditProfilePage()));
        },
      );

}
