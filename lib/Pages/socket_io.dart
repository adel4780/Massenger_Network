import 'dart:math';

import 'package:flutter/material.dart';
import '../chatmodel/chat_model.dart';
class SocketIoScreen extends StatefulWidget {
  final ChatModel data ;
  final int idx;
  const SocketIoScreen({super.key, required this.data, required this.idx, });
  @override
  State<SocketIoScreen> createState() => _SocketIoState();
}

class _SocketIoState extends State<SocketIoScreen> {
  late TextEditingController textcontroller;
  List<ChatModel> messages = [];
  late int userId;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    textcontroller = TextEditingController();
    messages.add(widget.data);
    // Erfan
    // UserID bara inke mak payam midam ya on payam mide
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
        automaticallyImplyLeading: false,
        //title: const Text("Chat"),
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 10,),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              //backgroundImage: ,
            ),
            const SizedBox(width: 10,),
            Text(widget.data.name, style:const TextStyle(fontSize: 16),),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/chat.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                    child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                              // UserID bara inke mak payam midam ya on payam mide
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if(textcontroller.text.isNotEmpty){ // check
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
                      icon: const Icon(Icons.insert_emoticon),
                    ),
                    Expanded(
                      child: TextField(
                        controller: textcontroller,
                        decoration: const InputDecoration(
                          hintText: "type",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Erfan Ersal Payam ba soocket
                      },
                      icon: const Icon(Icons.send),
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
