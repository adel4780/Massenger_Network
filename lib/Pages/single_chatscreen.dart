import 'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';
import 'package:massenger/chatmodel/chat_model.dart';
class SingleChatScreen extends StatelessWidget {
  final ChatModel data ;

  SingleChatScreen({required this.data});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat Page${data.name}", style: const TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () { // یک پیج بساز
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MassengerHome()));
                  },
                  child: const Text("Second Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
