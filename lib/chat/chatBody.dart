import 'package:flutter/material.dart';
import 'package:massenger/socket_service.dart';
import 'package:massenger/chat/chat.dart';
import 'message_view.dart';
class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var chats = <Chat>[];
    ScrollController _scrollController = ScrollController();

    ///scrolls to the bottom of page
    void _scrollDown() {
      try {
        Future.delayed(
            const Duration(milliseconds: 300),
                () => _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent));
      } on Exception catch (_) {}
    }

    return Expanded(
      child: StreamBuilder(
        //Erfan Socket
        stream: SocketService.getResponse,
        builder: (BuildContext context, AsyncSnapshot<Chat> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data != null) {
            chats.add(snapshot.data!);
          }
          _scrollDown();
          return ListView.builder(
            controller: _scrollController,
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) =>
                MessageView(chat: chats[index]),
          );
        },
      ),
    );
  }
}