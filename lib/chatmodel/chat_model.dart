class ChatModel {
  late final int id;
  late final String email;
  late final String phone;
  late final String name;
  late final Map<String,String> messages ; //Map<String,String>
  late final String avatarUrl;
  late bool select;
  ChatModel(
      {
      required this.email,
      required this.phone,
      required this.id,
      required this.name,
      required this.avatarUrl,
      this.select = false,
      required this.messages,
      }
  );
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
