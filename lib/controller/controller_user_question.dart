part of 'controller.dart';

class UserQuestionController extends GetxController {
  final LoginControllers _loginController = Get.put(LoginControllers());
  final TextEditingController feedback = TextEditingController();

  final listQuestion = ListQuestion(status: true, question: <Question>[]).obs;
  final indexQuestion = 0.obs;
  final isButtonNextActive = false.obs;
  final idOption = 1.obs;
  final sangatSetujuActive = false.obs;
  final setujuActive = false.obs;
  final tidakSetujuActive = false.obs;
  final sangatTidakSetujuActive = false.obs;

  void handlePostSurvey(int idQuestion) async {
    try {
      var response = await ServiceUserQuestion.createSurvey(_loginController.user.value.user.id_user, idQuestion, idOption.value);
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleNext();
      }
    }catch(e){
      print(e);
    }
  }

  void handlePostFeedback() async {
    try {
      var response = await ServiceUserQuestion.createFeedback(_loginController.user.value.user.id_user, listQuestion.value.question[0].idCategory, feedback.text);
      if(response.status){
        indexQuestion.value = 0;
        feedback.clear();
        Get.snackbar('Information', response.message, backgroundColor: Colors.blueAccent);
        Get.to(() => const UserFinishSurveyView());
      }

    }catch(e){
      print(e);
    }
  }

  void handleReadQuestionByCategory(String id) async {
    try {
      var response = await ServiceUserQuestion.readQuestion(id);
      if(response.status){
        listQuestion.update((_) {
          listQuestion.value.question = response.question;
        });
      }
      print(response.question.map((e) => e.question));
    }catch(e){
      print(e);
    }
  }

  void handleNext(){
    if(indexQuestion.value < listQuestion.value.question.length - 1){
      indexQuestion.value = indexQuestion.value + 1;
    } else {
      Get.to(() => UserFeedbackView());
    }

    isButtonNextActive.update((_) {
      isButtonNextActive.value = false;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = false;
    });

    setujuActive.update((_) {
      setujuActive.value = false;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = false;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = false;
    });
  }

  void handleOptionSangatSetuju(){
    idOption.value = 1;
    isButtonNextActive.update((_) {
      isButtonNextActive.value = true;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = true;
    });

    setujuActive.update((_) {
      setujuActive.value = false;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = false;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = false;
    });

    // Get.snackbar("Information", "Anda Memilih Sangat Setuju");
  }

  void handleOptionSetuju(){
    idOption.value = 2;
    isButtonNextActive.update((_) {
      isButtonNextActive.value = true;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = false;
    });

    setujuActive.update((_) {
      setujuActive.value = true;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = false;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = false;
    });
    // Get.snackbar("Information", "Anda Memilih Setuju");
  }

  void handleOptionTidakSetuju(){
    idOption.value = 3;
    isButtonNextActive.update((_) {
      isButtonNextActive.value = true;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = false;
    });

    setujuActive.update((_) {
      setujuActive.value = false;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = true;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = false;
    });
    // Get.snackbar("Information", "Anda Memilih Tidak Setuju");
  }

  void handleOptionSangatTidakSetuju(){
    idOption.value = 4;
    isButtonNextActive.update((_) {
      isButtonNextActive.value = true;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = false;
    });

    setujuActive.update((_) {
      setujuActive.value = false;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = false;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = true;
    });

    // Get.snackbar("Information", "Anda Memilih Sangat Tidak Setuju");
  }

  Future<bool> handleOnBackPressed() async {
    indexQuestion.value = 0;

    isButtonNextActive.update((_) {
      isButtonNextActive.value = false;
    });

    sangatSetujuActive.update((_) {
      sangatSetujuActive.value = false;
    });

    setujuActive.update((_) {
      setujuActive.value = false;
    });
    tidakSetujuActive.update((_) {
      tidakSetujuActive.value = false;
    });

    sangatTidakSetujuActive.update((_) {
      sangatTidakSetujuActive.value = false;
    });
    return true;
  }
}