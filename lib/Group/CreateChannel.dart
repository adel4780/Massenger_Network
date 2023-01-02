import 'package:massenger/Group/AvtarCard.dart';
import 'package:massenger/Group/ContactCard.dart';
import 'package:massenger/Group/put_Channelname.dart';
import 'package:massenger/chatmodel/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:massenger/search.dart';

import 'SelectContact.dart';
class CreateChannel extends StatefulWidget {
  @override
  _CreateChannelState createState() => _CreateChannelState();
}

// Create Group, SelectContact, Contact Card
// Chat Model, Avatar Card
class _CreateChannelState extends State<CreateChannel> {
  List<ChatModel> Channelmember = [];
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
                "New Channel",
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
              if(Channelmember.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PutChannelName(members: Channelmember)));
              }
            },
            child: const Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: Channelmember.isNotEmpty ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if(contacts[index - 1].select == true){
                        contacts[index - 1].select = false;
                        setState(() {
                          Channelmember.remove(contacts[index - 1]);
                        });
                      }else if(contacts[index - 1].select == false){
                        contacts[index - 1].select = true;
                        setState(() {
                          Channelmember.add(contacts[index - 1]);
                        });
                      }
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            if (Channelmember.isNotEmpty)
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
                                        Channelmember.remove(contacts[index]);
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
