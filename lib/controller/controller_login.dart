part of 'controller.dart';

class LoginControllers extends GetxController {

  final user = UserLoginSuccess(status: false, message: "un know message", token: "secret value", user: User(username: "username", email: "email", firstname: "firstname", phone: 'phone', lastname: "lastname", role: Role(idRole: 1, loginType: "admin"), id_user: 1, profesi: "profesi", profile_picture: "profesi", validasi_one: "ab", validasi_two: "ab")).obs;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  var txtPasswordVisibility = true.obs;

  void handleLogin() async{
    try{
      var response = await ServiceUser.loginUser(username.text, password.text);
      if(response.value.status){
        user.update((_) {
          user.value.user = response.value.user;
        });

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.value.token);
        await prefs.setInt('idUser', response.value.user.id_user);

        if(user.value.user.role.idRole == 1){
          Get.to(() => AdminView(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
        } else {
          Get.to(() => HomeView(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
        }

      }else {
        Get.snackbar("Information", "${response.value.message}", backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
      clearInput();
    }catch(e){
      print(e);
    }
  }

  void handleToRegister(){
    clearInput();
    Get.to(() => ViewRegister());
  }

  void clearInput(){
    username.clear();
    password.clear();
  }

  void goToForgetPassword(){
    Get.to(() => ForgetPassword());
  }
}