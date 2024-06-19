part of 'controller.dart';

class WelcomeController extends GetxController {

  final token = "".obs;

  @override
  void onInit(){
    checkToken();
    super.onInit();
  }
  void handleToRegister(){
    Get.to(() => ViewRegister());
  }

  void handleToLogin(){
    Get.to(() => ViewLogin());
  }

  void checkToken() async{
    try {
      final prefs = await SharedPreferences.getInstance();
      String? valueToken = prefs.getString('token');
      token.update((val) {
        token.value = valueToken ?? "abc";
      });
      if(token.isNotEmpty){
        Map<String, dynamic> payload = Jwt.parseJwt(token.value);
        print(payload);
        if(payload["id_role"] == 2) {
          Get.to(() => HomeView(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
        } else if(payload["id_role"] == 1) {
          Get.to(() => AdminView(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
        } else {
          Get.to(() => ViewLogin(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
        }
      } else {
        Get.to(() => ViewLogin(), transition: Transition.downToUp, duration: const Duration(seconds: 3));
      }
    }catch(e){
      print(e);
    }
  }

}