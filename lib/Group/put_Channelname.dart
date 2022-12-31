import 'package:flutter/material.dart';
import '../chatmodel/chat_model.dart';
import 'channel_widget.dart';


class PutChannelName extends StatelessWidget {
  List<ChatModel> members;
  PutChannelName({required this.members});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "ChannelName",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 25),
          ChannelWidget(
            //Erfan Choose Group Picture with Camera System
            //adel tooye onclick neveshtam nemidoonam doroste ya na jash, dorost bood bepak.
            //adel profile chie?
            onClicked: () async {

            },
          ),
          const SizedBox(height: 25),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Channel Name',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Center(child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              // Erfan
              // Create a Group and show in all, group_Screen

              for(var i in members){
                print(i.name);
                i.select = false;
              }
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: Text("Create"),
          ),
          ),
        ],
      ),
    );
  }
}
