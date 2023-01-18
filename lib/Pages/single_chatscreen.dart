import 'package:flutter/material.dart';
import 'package:massenger/ProfileComponent/page/profile_page.dart';
import '../chat/chatBody.dart';
import '../chat/chat_text_input.dart';
import '../chat/user_list_view.dart';
import '../chatmodel/chat_model.dart';
import '../services/socket_service.dart';
import 'package:massenger/socket_service.dart';
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
          UserListView(),
          ChatBody(),
          SizedBox(height: 6),
          ChatTextInput(),
        ],
      ),
    );
  }
}