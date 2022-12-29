import 'package:flutter/material.dart';
import 'package:massenger/Pages/socket_io.dart';
import 'package:massenger/massenger_home.dart';
import 'package:massenger/chatmodel/chat_model.dart';
class SingleChatScreen extends StatelessWidget {
  final ChatModel data ;
  late TextEditingController textcontroller;
  List<ChatModel> messages = [];
  SingleChatScreen({required this.data,}){
    messages.addAll(dummyData);
    textcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 10,),
            const CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            const SizedBox(width: 10,),
            Text(data.name, style:const TextStyle(fontSize: 16),),
          ],
        ),
      ),

    );
  }
}
