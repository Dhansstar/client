part of 'controller.dart';

class RegisterControllers extends GetxController {

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController validationOne = TextEditingController();

  final listColor = ["Select Role", "Hijau", "Kuning", "Merah" , "Biru", "Hitam", "Abu-Abu", "Pink", "Ungu" ,"Emas" , "Orange"];
  final valueColor = "Select Role".obs;

  Rx<List<DropdownMenuItem<String>>> listRoleDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);
  Rx<List<Role>> listRole = Rx<List<Role>>([]);

  var selectValueRole = "0".obs;

  final idRole = "0".obs;


  void handleReadRole() async {
    try {
      var response = await ServiceRole.readRole();
      if(response.status){
        listRole.value.clear();
        listRole.value.addAll(response.dataRole);
        listRoleDropDownMenuItem.value = [];
        listRoleDropDownMenuItem.value.add(
            DropdownMenuItem(child: Text("Select Role"), value: "0",)
        );

        for(Role role in listRole.value){
          listRoleDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(role.loginType),
                value: role.idRole.toString()
              )
          );
        }
      }
    }catch(e) {
      print(e);
    }
  }

  void handleValue(dynamic abc) {
    valueColor.value = abc;
    //print(valueColor);
  }

  void handleValueRole(dynamic abc) {
    selectValueRole.value = abc;
  }

  void handleIdRole(valuedIdRole){
    idRole.value = valuedIdRole;
  }

  void handleRegister() async {
    try {
      var response = await ServiceUser.registerUser(firstname.text, lastname.text, username.text, password.text, idRole.value, validationOne.text.toLowerCase(), valueColor.value.toLowerCase());
        if(response.value.status){
          Get.snackbar("Information", "${response.value.message}", backgroundColor: Colors.blueAccent, colorText: Colors.white);
          Get.off (() => ViewLogin());
        } else {
        Get.snackbar("Information", "${response.value.message}", backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
      clearInput();
    }catch(e){
      print(e);
    }
  }

  void handleBackToLogin(){
    clearInput();
    Get.to(() => ViewLogin());
  }

  @override
  void onInit(){
    handleReadRole();
    super.onInit();
  }


  void clearInput(){
    firstname.clear();
    lastname.clear();
    username.clear();
    password.clear();
    validationOne.clear();
    idRole.value = "0";
    valueColor.value = "Hijau";


  }


}