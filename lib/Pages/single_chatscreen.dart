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
// Erfan
// Ersal payam, List payam ha ro dorost kon
// Payam Jadid biad to Map payam haye dota Karbar, ham message ham Time
class _SingleChatScreen extends State<SingleChatScreen> {
  late TextEditingController textController;
  late int userId = 1003;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    textController = TextEditingController();

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
                  // Ax profile
                  backgroundImage: AssetImage("img/person.png"),
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
         ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
            //Erfan
            // Add User to contact List with data
            setState(() {
              icon: Icon(Icons.check);
            });
          },

          ),
        ],
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
                      itemCount: widget.data.messages.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                            // UserID bara inke mak payam midam ya on payam mide
                              color: userId == widget.data.id
                                  ? Colors.blueAccent
                                  : Colors.white
                          ),
                          child: Row(
                            children: [
                              for(var i in widget.data.messages.values)
                              Text(i),
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

                      },
                      icon: const Icon(Icons.attachment_outlined),
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
                      //  SocketService.setReceiverID("null");//adel be ki befreste? be Taraf ba Id ke dadim behesh
                      //  SocketService.sendMessage("PV",message);
                        setState(() {
                          widget.data.messages.addAll({"10:55":message});
                          textController.text = '';
                          //Erfan Time ro befrest az Server
                          }
                        );
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