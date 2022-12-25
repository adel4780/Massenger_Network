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
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 10,),
            CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            SizedBox(width: 10,),
            Text(data.name, style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat Page" + data.name, style: TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () { // یک پیج بساز
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MassengerHome()));
                  },
                  child: Text("Second Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
