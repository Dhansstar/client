part of 'service.dart';

class ServiceAdminQuestion {
  static Future<ListOfQuestion> readAllQuestion() async {
    var response = await http.get(Uri.parse(Endpoint.quizAdmin));
    switch(response.statusCode){
      case 200 :
        return ListOfQuestion.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<DetailQuestion> readDetailQuestion({String id="5"}) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:7000/quiz/$id"));
    switch(response.statusCode){
      case 200 :
        return DetailQuestion.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<AdminResultSurveyOneModel> readResultSurveyService(String id) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:7000/survey/$id"));
    switch(response.statusCode){
      case 200 :
        return AdminResultSurveyOneModel.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> addQuestion(String idCategory, String question) async {
    final response = await http.post(
        Uri.parse(Endpoint.quizAdd),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "idCategory" : idCategory,
          "question" : question
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> deleteQuestion({String id="5"}) async{
    final response = await http.delete(
      Uri.parse("http://10.0.2.2:7000/quiz/delete/$id"),
      headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> updateQuestion(String idCategory, String question, {String id="5"}) async {
    final response = await http.put(
        Uri.parse("http://10.0.2.2:7000/quiz/update/$id"),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "idCategory" : idCategory,
          "question" : question
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }
}