part of 'controller.dart';

class ForgetPasswordController extends GetxController {

  final TextEditingController username = TextEditingController();
  final TextEditingController validationOne = TextEditingController();
  final TextEditingController validationTwo = TextEditingController();
  final TextEditingController password = TextEditingController();

  var txtPasswordVisibility = true.obs;

  void handleForgetPassword() async {
    try {
      var response = await ServiceUser.forgetPassword(username.text.toString(), validationOne.text.toString(), validationTwo.text.toString(), password.text);
      print(response.status);
      if(response.status) {
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        Get.to(() => ViewLogin());
        // clearInput();
        //
      } else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.redAccent);
      }

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
    validationOne.clear();
    validationTwo.clear();
    password.clear();
  }
}