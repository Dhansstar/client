part of 'controller.dart';

class AdminListCategoryController extends GetxController {
  final TextEditingController keterangan = TextEditingController(text: "abc");
  final TextEditingController categorys = TextEditingController();
  final category = ListOfCategory(dataCategory: <Category>[], status: false).obs;
  Rx<List<Menu>> listMenu = Rx<List<Menu>>([]);
  Rx<List<DropdownMenuItem<String>>> listMenuDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);
  final isEdit = false.obs;
  final dataEdit = DetailCategory(status: false, data: Category(idCategory: 1, category: "category", keterangan: "keterangan", menu: Menu(idMenu: 1, menu: "menu"))).obs;
  var selectValueMenu = "0".obs;
  final idMenu = "0".obs;

  @override
  void onInit(){
    handleReadCategory();
    handleReadMenu();
    super.onInit();
  }


  void handleReadMenu() async {
    try {
      var response = await ServiceAdminCategory.readAllMenu();
      if(response.status){
        listMenu.value.clear();
        listMenu.value.addAll(response.menu);
        listMenuDropDownMenuItem.value = [];
        listMenuDropDownMenuItem.value.add(
            DropdownMenuItem(child: Text("Select Menu"), value: "0",)
        );

        for(Menu menu in listMenu.value){
          listMenuDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(menu.menu),
                value: menu.idMenu.toString()
              )
          );
        }
      }
    }catch(e) {
      print(e);
    }
  }

  void handleReadCategory() async {
    try {
      isEdit.update((_) {
        isEdit.value = true;
      });
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

  void handleReadDetailCategory({String id="5"}) async {
    try {
      isEdit.update((_) {
        isEdit.value = true;
      });
      var response = await ServiceAdminCategory.readDetailCategory(id: id);
      if(response.status) {
        dataEdit.update((_) {
          dataEdit.value.data = response.data;
        });
        setDataEdit();
        Get.to(() => AdminListCategoryAddView());
      }
    } catch(e){
      print(e);
    }
  }

  void setDataEdit() {
    keterangan.text = dataEdit.value.data.keterangan;
    categorys.text = dataEdit.value.data.category;
  }

  void handleAddCategory() async {
    try {
      var response = await ServiceAdminCategory.addCategory(categorys.text, keterangan.text, idMenu.value);
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleReadCategory();
        clearInput();

      }else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.red);
        clearInput();
      }
    }catch(e){
      print(e);
    }
  }

  void handleDeleteCategory({String id="10"}) async {
    try {
      var response = await ServiceAdminCategory.deleteCategory(id: id);
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleReadCategory();
        clearInput();
      }else {
        Get.snackbar("Information", response.message, backgroundColor: Colors.red);
        clearInput();
      }
    }catch(e){
      print(e);
    }
  }

  void clearInput(){
    keterangan.clear();
    categorys.clear();
  }

  void handleUpdateCategory() async {
    try {
      isEdit.update((_) {
        isEdit.value = false;
      });
      var response = await ServiceAdminCategory.updateCategory(categorys.text, keterangan.text, idMenu.value,id: dataEdit.value.data.idCategory.toString());
      if(response.status){
        Get.snackbar("Information", response.message, backgroundColor: Colors.blueAccent);
        handleReadCategory();
        clearInput();
        // isEdit.update((_) {
        //   isEdit.value = false;
        // });

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

  void handleValue(dynamic abc) {
    selectValueMenu.value = abc;
  }

  void handleIdMenu(valuedIdMenu){
    idMenu.value = valuedIdMenu;
  }
}