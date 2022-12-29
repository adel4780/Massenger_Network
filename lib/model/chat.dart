class Chat {
  final String? senderID;
  final String? receiverID;

  final String? message;
  final String? time;
  final String? type;

  Chat({
    this.type,
    this.senderID,
    this.receiverID,
    this.message,
    this.time,
  });

  factory Chat.fromRawJson(Map<String, dynamic> jsonData) {
    return Chat(
        type: jsonData['type'],
        senderID: jsonData['senderID'],
        receiverID: jsonData['receiverID'],
        message: jsonData['message'],
        time: jsonData['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "userId": senderID,
      "userName": receiverID,
      "message": message,
      "time": time,
    };
  }
}
