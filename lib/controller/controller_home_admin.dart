part of 'controller.dart';

class HomeViewAdminController extends GetxController {

  final LoginControllers loginController = Get.put(LoginControllers());

  final dataUpdateUser = FindUser(status: true, data: User(username: "username", email: "email", firstname: "firstname", phone: "phone", lastname: "lastname", role: Role(idRole: 1, loginType: "admin"), id_user: 1, profesi: "profesi", profile_picture: "profile_picture", validasi_one: "validasi_one", validasi_two: "validasi_two")).obs;

  var boxChangeColor = true.obs;
  @override
  void onInit(){
    findUser();
    super.onInit();
  }

  void findUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      int? id = prefs.getInt('idUser');
      print(id);
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      var response = await ServiceUser.findUser(id.toString(), token!);
      // var response = await ServiceUser.findUser(loginController.user.value.user.id_user.toString(), token!);
      if(response.status) {
        dataUpdateUser.update((_) {
          dataUpdateUser.value.data = response.data;
        });
      }

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