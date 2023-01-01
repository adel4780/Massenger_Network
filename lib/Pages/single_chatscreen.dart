import 'package:flutter/material.dart';
import 'package:massenger/ProfileComponent/page/profile_page.dart';
import '../chatmodel/chat_model.dart';
import '../services/socket_service.dart';
class SingleChatScreen extends StatefulWidget {
  final ChatModel data ;
  final int idx;
  const SingleChatScreen({super.key, required this.data, required this.idx, });
  @override
  State<SingleChatScreen> createState() => _SingleChatScreen();
}

class _SingleChatScreen extends State<SingleChatScreen> {
  late TextEditingController textController;
  List<ChatModel> messages = [];
  late int userId;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    textController = TextEditingController();
    messages.add(widget.data);
    // Erfan
    // UserID bara inke mak payam midam ya on payam mide
    // adel userid niaz nis socket id has
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var focusCode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(),
        title: GestureDetector(
          child: Row(
              children:[
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  // Ax profile
                  //backgroundImage: ,

                ),
                const SizedBox(width: 10,),
                Text(widget.data.name, style:const TextStyle(fontSize: 16),),
              ],
          ),
          onTap: () {
            // Erfan
            // Profile Friend Information
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }
          ) ,
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
                        if(textController.text.isNotEmpty){ // check
                          String msg = textController.text;
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
                          textController.text = '';
                        }
                      },
                      icon: const Icon(Icons.insert_emoticon),
                    ),
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: "type",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        var message = textController.text;
                        if (message.isEmpty) return;
                        SocketService.setReceiverID("null");//adel be ki befreste?
                        SocketService.sendMessage("PV",message);
                        textController.text = '';
                        focusCode.requestFocus();//ADEL bara bastan kiborde mobile harja niaz bood bezan inja albate nemikhad fek konam
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