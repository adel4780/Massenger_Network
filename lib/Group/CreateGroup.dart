import 'package:massenger/Group/AvtarCard.dart';
import 'package:massenger/Group/ContactCard.dart';
import 'package:massenger/Group/put_Groupname.dart';
import 'package:massenger/chatmodel/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:massenger/search.dart';

import 'SelectContact.dart';
class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

// Create Group, SelectContact, Contact Card
// Chat Model, Avatar Card
class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> groupmember = [];
@override
  void initState() {
    for(var user in contacts){
      user.select = false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: const Icon(
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              if(groupmember.isNotEmpty)
                Navigator.push(context, MaterialPageRoute(builder: (context) => PutGroupName(group: groupmember)));
            },
            child: const Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.isNotEmpty ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if(contacts[index - 1].select == true){
                        contacts[index - 1].select = false;
                        setState(() {
                          groupmember.remove(contacts[index - 1]);
                        });
                      }else if(contacts[index - 1].select == false){
                        contacts[index - 1].select = true;
                        setState(() {
                          groupmember.add(contacts[index - 1]);
                        });
                      }
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            if (groupmember.isNotEmpty)
              Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        contacts[index].select = false;
                                        groupmember.remove(contacts[index]);
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                }
                                return Container();
                              }),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  )
            else Container(),
          ],
        ));
  }
}
