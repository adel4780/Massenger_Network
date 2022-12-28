class Chat {
  final String? userId;
  final String? userName;

  final String? message;
  final String? time;
  final String? type;

  Chat({
    this.type,
    this.userId,
    this.userName,
    this.message,
    this.time,
  });

  factory Chat.fromRawJson(Map<String, dynamic> jsonData) {
    return Chat(
        type: jsonData['type'],
        userId: jsonData['userId'],
        userName: jsonData['userName'],
        message: jsonData['message'],
        time: jsonData['time']);
  }
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "userId": userId,
      "userName": userName,
      "message": message,
      "time": time,
    };
  }
}
