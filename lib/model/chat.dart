class Chat {
  final String? senderID;
  final String? receiverID;

  final String? message;
  final String? time;
  final String? type;
  final String? userId;


  Chat({
    this.type,
    this.userId,
    this.senderID,
    this.receiverID,
    this.message,
    this.time,
  });

  factory Chat.fromRawJson(Map<String, dynamic> jsonData) {
    return Chat(
        type: jsonData['type'],
        userId:jsonData['userId'],
        senderID: jsonData['senderID'],
        receiverID: jsonData['receiverID'],
        message: jsonData['message'],
        time: jsonData['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "userId": userId,
      "senderID": senderID,
      "userName": receiverID,
      "message": message,
      "time": time,
    };
  }
}
