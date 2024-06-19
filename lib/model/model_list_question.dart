part of 'model.dart';

class ListQuestion {
  bool status;
  List<Question> question;

  ListQuestion({required this.status, required this.question});

  factory ListQuestion.fromJson(Map<String, dynamic> json){
    var listQuiz = json["question"] as List;
    List<Question> quizList = listQuiz.map((e) => Question.fromJson(e)).toList();
    return ListQuestion(status: json["status"], question: quizList);
  }
}

class ListOfQuestion {
  bool status;
  List<QuestionList> data;

  ListOfQuestion({required this.status, required this.data});

  factory ListOfQuestion.fromJson(Map<String, dynamic> json){
    var listQuiz = json["data"] as List;
    List<QuestionList> quizList = listQuiz.map((e) => QuestionList.fromJson(e)).toList();
    return ListOfQuestion(status: json["status"], data: quizList);
  }
}

class QuestionList {
  int idQuestion;
  int idCategory;
  String question;
  CategoryQuestion category;
  
  QuestionList({required this.idQuestion, required this.idCategory, required this.question, required this.category});
  
  factory QuestionList.fromJson(Map<String, dynamic> json){
    return QuestionList(idQuestion: json["id_question"], idCategory: json["id_category"], question: json["question"], category: CategoryQuestion.fromJson(json["category"]));
  }
}

class Question {
  int id;
  int idCategory;
  String question;
  Question({required this.question, required this.idCategory, required this.id});

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(question: json["question"], idCategory: json["id_category"], id: json["id_question"]);
  }
}

class DetailQuestion {
  bool status;
  Question data;

  DetailQuestion({required this.status, required this.data});

  factory DetailQuestion.fromJson(Map<String, dynamic> json){
    return DetailQuestion(status: json["status"], data: Question.fromJson(json["data"]));
  }
}


class CategoryQuestion {
  int idCategory;
  String category;
  String keterangan;
  
  CategoryQuestion({required this.idCategory, required this.category, required this.keterangan});
  
  factory CategoryQuestion.fromJson(Map<String, dynamic> json){
    return CategoryQuestion(idCategory: json["id_category"], category: json["category"], keterangan: json["keterangan"]);
  }
}

class AdminResultSurveyOneModel {
  bool status;
  int totalResult;
  int sangatSetuju;
  int setuju;
  int tidakSetuju;
  int sangatTidakSetuju;

  AdminResultSurveyOneModel({required this.status, required this.sangatSetuju, required this.sangatTidakSetuju, required this.setuju, required this.tidakSetuju, required this.totalResult});

  factory AdminResultSurveyOneModel.fromJson(Map<String, dynamic> json){
    return AdminResultSurveyOneModel(
        status: json["status"],
        sangatSetuju: json["sangat_setuju"],
        sangatTidakSetuju: json["sangat_tidak_setuju"],
        setuju: json["setuju"],
        tidakSetuju: json["tidak_setuju"],
        totalResult: json["totalResult"]
    );
  }
}

class ListOfResult {
  List<Question> question;
  List<AdminResultSurveyOneModel> dataMaps;

  ListOfResult({required this.question, required this.dataMaps});

  // factory ListQuestion.fromJson(Map<String, dynamic> json){
  //   var listQuiz = json["question"] as List;
  //   List<Question> quizList = listQuiz.map((e) => Question.fromJson(e)).toList();
  //   return ListQuestion(status: json["status"], question: quizList);
  // }
}