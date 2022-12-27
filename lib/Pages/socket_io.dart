import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import '../chatmodel/chat_model.dart';

class SocketIoScreen extends StatefulWidget {
  const SocketIoScreen({Key? key}) : super(key: key);

  @override
  State<SocketIoScreen> createState() => _SocketIoState();
}

class _SocketIoState extends State<SocketIoScreen> {

  late TextEditingController textcontroller;
  List<ChatModel> messages = [];
  late int userId;
  @override
  void initState() {
    // TODO: implement initState
    textcontroller = TextEditingController();
    messages.addAll(dummyData);
    userId = Random().nextInt(1000);
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10,left: 10,top: 10),
                    child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: userId == messages[index].id
                              ? Colors.blueAccent
                              : Colors.white
                            ),
                            child: Row(
                              children: [
                                Text(messages[index].message),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if(!textcontroller.text.isEmpty){
                          String msg = textcontroller.text;
                          setState(() {
                            messages.add(ChatModel(
                              id: userId,
                              name: '',
                              message: msg,
                              time: '', // ?
                              avatarUrl: '',
                            )
                            );
                          });
                          textcontroller.text = '';
                        }
                      },
                      icon: Icon(Icons.insert_emoticon),
                    ),
                    Expanded(
                      child: TextField(
                        controller: textcontroller,
                        decoration: InputDecoration(
                          hintText: "type",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
