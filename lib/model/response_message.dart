part of "model.dart";

class ResponseMessage {
  bool status;
  String message;
  ResponseMessage({required this.message, required this.status});

  factory ResponseMessage.fromJson(Map<String, dynamic> json){
    return ResponseMessage(message: json["message"], status: json["status"]);
  }
}