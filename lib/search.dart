import 'package:flutter/material.dart';
import 'package:massenger/chatmodel/chat_model.dart';

import 'Pages/single_chatscreen.dart';
class SearchScreen extends SearchDelegate{
  List<ChatModel> searchTerms = dummyData;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = '',
          icon: Icon(Icons.clear),
      )
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: ()=>close(context, null),
        icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ChatModel> matchQuery = [];
    for(var account in searchTerms){
      if(account.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(account);
      }
    }
    return ListView.builder(
      itemCount:  matchQuery.length,
      itemBuilder: (context,index){
        return Column(
          children: [
            const Divider(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatScreen(data: matchQuery[index], idx: index,)));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(matchQuery[index].avatarUrl), // عکس پروفایل تغییر بده
                  backgroundColor: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(matchQuery[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(matchQuery[index].time, style: const TextStyle(color: Colors.grey, fontSize: 14),)
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(matchQuery[index].message, style: const TextStyle(color: Colors.grey, fontSize: 15),),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<ChatModel> matchQuery = [];
    for(var account in searchTerms){
      if(account.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(account);
      }
    }
    return ListView.builder(
      itemCount:  matchQuery.length,
      itemBuilder: (context,index){
        return Column(
          children: [
            const Divider(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatScreen(data: matchQuery[index], idx: index,)));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(matchQuery[index].avatarUrl), // عکس پروفایل تغییر بده
                  backgroundColor: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(matchQuery[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(matchQuery[index].time, style: const TextStyle(color: Colors.grey, fontSize: 14),)
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(matchQuery[index].message, style: const TextStyle(color: Colors.grey, fontSize: 15),),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}