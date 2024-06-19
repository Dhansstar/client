part of 'model.dart';

class Message {
  bool status;
  String message;
  Message({required this.message, required this.status});

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(message: json["message"], status: json["status"]);
  }
}