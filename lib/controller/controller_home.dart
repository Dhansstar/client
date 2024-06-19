part of 'controller.dart';

class HomeViewController extends GetxController {
  final LoginControllers loginController = Get.put(LoginControllers());
  Rx<List<Category>> listCategoryMandatory = Rx<List<Category>>([]);
  Rx<List<Category>> listCategoryChoice = Rx<List<Category>>([]);

  final token = "".obs;

  final dataUpdateUser = FindUser(status: true, data: User(username: "username", email: "email", firstname: "firstname", phone: "phone", lastname: "lastname", role: Role(idRole: 1, loginType: "admin"), id_user: 1, profesi: "profesi", profile_picture: "profile_picture", validasi_one: "validasi_one", validasi_two: "validasi_two")).obs;

  @override
  void onInit(){
    findUser();
    handleReadCategory();
    super.onInit();
  }

  void handleReadCategory() async {
    try {
      var response = await ServiceAdminCategory.readAllCategoryByMenu();
      if(response.status){
        // listCategoryMandatory.value.clear();
        listCategoryMandatory.value = response.mandatory;

        listCategoryChoice.value = response.choice;
      }
    }catch(e) {
      print(e);
    }
  }

  void findUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? valueToken = prefs.getString('token');
      token.update((val) {
        token.value = valueToken ?? "abc";
      });
      Map<String, dynamic> payload = Jwt.parseJwt(token.value);

      var response = await ServiceUser.findUser(payload["id"].toString(), token.value);

      if(response.status) {
        dataUpdateUser.update((_) {
          dataUpdateUser.value.data = response.data;
        });
      }
      print(dataUpdateUser.value.data.firstname);
    }catch(e){
      print(e);
    }
  }

  void logOut() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      Get.offAll(() => WelcomeView());
    }catch(e){
      print(e);
    }
  }
}