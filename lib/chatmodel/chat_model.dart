class ChatModel {
  late final int id;
  late final String name;
  late final String message;
  late final String time;
  late final String avatarUrl;
  late final bool select;
  ChatModel(
      {required this.id,
      required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl, required this.select});
 /* ChatModel.formChatModel(int id,String name, String avatarUrl){
   this.id = id;
   this.name = name;
   this.avatarUrl = avatarUrl;
  }*/// sharit
}
// Erfan 
// inja bayad List Afrad ro az Server biary to AllScreen//adel
// be database niaz daram:)

List<ChatModel> dummyData = [
  ChatModel(
      id: 1000,
      name: "Hessam",
      message: "Hello",
      time: "15:20",
      avatarUrl:
          "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png",
      select: false,
  ),
  ChatModel(
      id: 1000,
      name: "Hashem",
      message: "Salam",
      time: "14:30",
      avatarUrl:
          "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png",
      select: false,
  ),
  ChatModel(
      id: 1000,
      name: "Ali",
      message: "Hola",
      time: "10:45",
      avatarUrl:
          "https://www.daneshjooyar.com/wp-content/themes/daneshlight/Images/man-with-laptop.png",
    select: false,
  ),
  // -> ChatScreen
];
