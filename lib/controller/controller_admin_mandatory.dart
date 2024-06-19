part of 'controller.dart';

class AdminMandatoryController extends GetxController {

  final category = ListOfCategory(dataCategory: <Category>[], status: false).obs;
  final listQuestion = ListQuestion(status: true, question: <Question>[]).obs;
  final listOfOneCard = ListOfResult(question: <Question>[], dataMaps: <AdminResultSurveyOneModel>[]).obs;
  final totalLength = 1.obs;
  Rx<List<AdminResultSurveyOneModel>> listDataMaps = Rx<List<AdminResultSurveyOneModel>>([]);

  void handleReadCategory() async {
    try {

      var response = await ServiceAdminCategory.readAllCategory();
      if(response.status){
        category.update((_) {
          category.value.dataCategory = response.dataCategory;
        });
      }
    }catch(e) {
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
      listOfOneCard.update((_) {
        listOfOneCard.value.question = response.question;
      });
      listDataMaps.value.clear();
      listOfOneCard.value.dataMaps.clear();
      if(listOfOneCard.value.question.isNotEmpty){
        for(var i=0; i < listOfOneCard.value.question.length; i++) {
          var pieChart = await ServiceAdminQuestion.readResultSurveyService(listQuestion.value.question[i].id.toString());
          listDataMaps.value.add(pieChart);
          listOfOneCard.value.dataMaps.add(pieChart);
        }
      }


      totalLength.value = listQuestion.value.question.length;
      Get.to(() => AdminResultSurveyView());

      print(listOfOneCard.value.dataMaps.length);
    }catch(e){
      print(e);
    }
  }



  @override
  void onInit(){
    handleReadCategory();
    // handleReadQuestionByCategory();
    super.onInit();
  }
}