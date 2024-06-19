part of 'controller.dart';

class AdminListQuestionController extends GetxController {

  final TextEditingController question = TextEditingController();

  final listQuestion = ListOfQuestion(status: true, data: <QuestionList>[]).obs;
  Rx<List<DropdownMenuItem<String>>> listCategoryDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);
  Rx<List<Category>> listCategory = Rx<List<Category>>([]);
  final dataEdit = DetailQuestion(status: true, data: Question(question: "question", idCategory: 1, id: 1)).obs;
  var selectValueCategory = "0".obs;
  final idCategory = "0".obs;
  final isEdit = false.obs;



  void handleValue(dynamic abc) {
    selectValueCategory.value = abc;
  }

  @override
  void onInit(){
    handleReadListQuestion();
    handleReadCategory();
    super.onInit();
  }

  void handleReadListQuestion() async {
    try {
      var response = await ServiceAdminQuestion.readAllQuestion();
      if(response.status) {
        listQuestion.update((_) {
          listQuestion.value.data = response.data;
        });
      }
    }catch(e){
      print(e);
    }
  }

  void handleReadDetailQuestion({String id="5"}) async {
    try {
      isEdit.update((_) {
        isEdit.value = true;
      });
      var response = await ServiceAdminQuestion.readDetailQuestion(id: id);
      if(response.status){
        dataEdit.update((_) {
          dataEdit.value.data = response.data;
        });
        setDataEdit();
        Get.to(() => AdminListQuestionAddView());
      }
      print(response.data.question);
    } catch(e){
      print(e);
    }
  }

  void handleReadCategory() async {
    try {
      var response = await ServiceAdminCategory.readAllCategory();
      if(response.status){
        listCategory.value.clear();
        listCategory.value.addAll(response.dataCategory);
        listCategoryDropDownMenuItem.value = [];
        listCategoryDropDownMenuItem.value.add(
          DropdownMenuItem(child: Text("Select Category"), value: "0",)
        );

        for(Category category in listCategory.value){
          listCategoryDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(category.category),
              value: category.idCategory.toString(),
            )
          );
        }
      }
    }catch(e) {
      print(e);
    }
  }

  void handleIdCategory(valuedIdCategory){
    idCategory.value = valuedIdCategory;
  }

  void handleAddQuestion() async {
    try {
      var response = await ServiceAdminQuestion.addQuestion(idCategory.value, question.text);
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleReadListQuestion();
        clearInput();
      } else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.red);
        clearInput();
      }
    }catch(e){
      print(e);
    }
  }

  void handleDeleteQuestion({String id="10"}) async {
    try {
      var response = await ServiceAdminQuestion.deleteQuestion(id: id);
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleReadListQuestion();
        clearInput();
      }else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.red);
        clearInput();
      }
    }catch(e){
      print(e);
    }
  }

  void handleUpdateQuestion() async {
    try {
      isEdit.update((_) {
        isEdit.value = false;
      });

      var response = await ServiceAdminQuestion.updateQuestion(idCategory.value, question.text, id: dataEdit.value.data.id.toString());
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        clearInput();
        handleReadListQuestion();


      }else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.red);
        clearInput();
      }
    }catch(e){
      print(e);
    }
  }

  void handleIsEdit(){
    isEdit.update((_) {
      isEdit.value = false;
    });
  }



  void clearInput(){
    question.clear();
  }

  void setDataEdit() {
    question.text = dataEdit.value.data.question;
  }

}

