part of 'service.dart';

class ServiceUserQuestion {
  
  static Future<ListQuestion> readQuestion(String id) async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:7000/quiz/user/$id")
    );

    switch(response.statusCode){
      case 200 :
        return ListQuestion.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> createSurvey(int idUser, int idQuestion, int idResult) async {
    final response = await http.post(
        Uri.parse(Endpoint.postSurvey),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, int>{
          "idUser" : idUser,
          "idQuestion" : idQuestion,
          "idResult" : idResult
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> createFeedback(int idUser, int idCategory, String feedback) async {
    final response = await http.post(
        Uri.parse(Endpoint.postFeedback),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body:jsonEncode(<String, dynamic>{
          "idUser" : idUser,
          "idCategory" : idCategory,
          "feedback" : feedback
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create albfaaum.');
    }
  }
}