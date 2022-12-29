import 'package:flutter/material.dart';
import 'package:massenger/chatmodel/chat_model.dart';
import 'package:massenger/Pages/single_chatscreen.dart';
class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Divider(
              height: 10,
            ),
            GestureDetector(
              onTap: () { //SocketIoScreen // SingleChatScreen(data: dummyData[index])
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatScreen(data: dummyData[index], idx: index,)));
                },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dummyData[index].avatarUrl), // عکس پروفایل تغییر بده
                  backgroundColor: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dummyData[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(dummyData[index].time, style: const TextStyle(color: Colors.grey, fontSize: 14),)
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(dummyData[index].message, style: const TextStyle(color: Colors.grey, fontSize: 15),),
                ),
              ),
            ),
          ],
        );
      },
    );
      /*Center(
      child: Text("All chat",style: TextStyle(fontSize: 20),),
    );*/
  }
}
