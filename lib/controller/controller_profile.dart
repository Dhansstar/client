part of 'controller.dart';

class ProfileControllers extends GetxController {
  final LoginControllers loginController = Get.put(LoginControllers());

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController profesi = TextEditingController();
  final TextEditingController validationOne = TextEditingController();

  final token = "".obs;

  final dataUpdateUser = FindUser(status: true, data: User(username: "username", email: "email", firstname: "firstname", phone: "phone", lastname: "lastname", role: Role(idRole: 1, loginType: "admin"), id_user: 1, profesi: "profesi", profile_picture: "profile_picture", validasi_one: "validasi_one", validasi_two: "validasi_two")).obs;


  final listColor = ["Hijau", "Kuning", "Merah" , "Biru", "Hitam", "Abu-Abu", "Pink", "Ungu" ,"Emas" , "Orange"];
  final valueColor = "Hijau".obs;

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
    print(valueColor);
  }

  void handleValueRole(dynamic abc) {
    selectValueRole.value = abc;
  }

  void handleIdRole(valuedIdRole){
    idRole.value = valuedIdRole;
  }

  void uploadImage(ImageSource imageSource) async{
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);


      if(image != null) {
        await ServiceUser.uploadFile(image.path, loginController.user.value.user.id_user.toString());
      }
      findUser();
    }catch(e){
      print(e);
    }
  }

  void updateUser() async{
    try {

      final prefs = await SharedPreferences.getInstance();
      String? valueToken = prefs.getString('token');
      token.update((val) {
        token.value = valueToken ?? "abc";
      });
      Map<String, dynamic> payload = Jwt.parseJwt(token.value);

      var response = await ServiceUser.updateUser(
          firstname.text, lastname.text, username.text,
          email.text, phone.text, profesi.text,
          payload["id"].toString(),
          idRole.value, validationOne.text.toLowerCase(), valueColor.value.toLowerCase()
      );

      if(response.status){
        var responseUpdate = await ServiceUser.findUser(payload["id"].toString(), valueToken!);
        if(responseUpdate.data.role.idRole == 1) {
          Get.to(() => AdminView());
        } else {
          Get.to(() => HomeView());
        }
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
      } else {
        // Get.back();
        Get.snackbar("Information", response.message, backgroundColor: Colors.redAccent);
      }


    }catch(e){
      print(e);
    }
  }

  @override
  void onInit(){
    findUser();
    handleReadRole();
    super.onInit();
  }

  void findUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      var response = await ServiceUser.findUser(payload["id"].toString(), token!);
      if(response.status) {
        firstname.text = response.data.firstname;
        lastname.text = response.data.lastname;
        username.text = response.data.username;
        email.text = response.data.email;
        phone.text = response.data.phone;
        profesi.text = response.data.profesi;
        validationOne.text = response.data.validasi_one;
        idRole.value = response.data.role.idRole.toString();

        dataUpdateUser.update((_) {
          dataUpdateUser.value.data = response.data;
        });
      }

    }catch(e){
      print(e);
    }
  }
}