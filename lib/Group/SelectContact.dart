import 'package:massenger/Group/ButtonCard.dart';
import 'package:massenger/Group/CreateChannel.dart';
import 'package:massenger/Group/CreateGroup.dart';
import 'package:flutter/material.dart';
import '../Pages/single_chatscreen.dart';
import '../chatmodel/chat_model.dart';
import '../search.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}
List<ChatModel> contacts = [
  ChatModel(
    id: 1000,
    email: "a@gmail.com",
    phone: "09132235641",
    name: "Hessam",
    messages: {
      "10:05" : "Hello",
    },
    avatarUrl:
    "img/person.png",
  ),
  ChatModel(
    id: 1001,
    email: "b@gmail.com",
    phone: "09132235634",
    name: "Hashem",
    messages: {
      "10:07" : "Hi",
    },
    avatarUrl:
    "img/person.png",
  ),
  ChatModel(
    id: 1002,
    name: "Ali",
    email: "c@gmail.com",
    phone: "09132235658",
    messages: {
      "10:05" : "Salam",
    },
    avatarUrl:
    "img/person.png",
  ),
  // -> ChatScreen
];
class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchScreen(),
                  );
                }
                ),
            ],
        ),
        body: ListView.builder(
            // New Group, New Contact
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: const ButtonCard(
                    icon: Icons.group,
                    name: "New Group",
                  ),
                );
              } else if (index == 1) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateChannel()));
                  },
                  child: const ButtonCard(
                  icon: Icons.campaign_outlined,
                  name: "New Channel",
                  ),
                );
              }else{
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatScreen(data: contacts[index - 2], idx: index - 2,)));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contacts[index - 2].avatarUrl),
                      backgroundColor: Colors.grey,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(contacts[index - 2].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              }
            },
        ),
    );
  }
}
