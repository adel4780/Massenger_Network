import 'package:flutter/material.dart';
class ChatModel{
  late final int id;
  late final String name;
  late final String message;
  late final String time;
  late final String avatarUrl;
  ChatModel({required this.id,required this.name,required this.message,required this.time,required this.avatarUrl}); // sharit
}
List<ChatModel> dummyData = [
  new ChatModel(id: 1000, name: "Hessam", message: "Hello", time: "15:20", avatarUrl: "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png"),
  new ChatModel(id: 1000, name: "Hashem", message: "Salam", time: "14:30", avatarUrl: "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png"),
  new ChatModel(id: 1000, name: "Ali", message: "Hola", time: "10:45", avatarUrl: "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png"),
  // -> ChatScreen
];
