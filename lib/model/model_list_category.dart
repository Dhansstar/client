part of 'model.dart';

class ListOfCategory {
  bool status;
  List<Category> dataCategory;
  

  ListOfCategory({required this.dataCategory, required this.status});

  factory ListOfCategory.fromJson(Map<String, dynamic> json){
    var listCategory = json['data'] as List;
    List<Category> categoryList = listCategory.map((i) => Category.fromJson(i)).toList();
    return ListOfCategory(dataCategory: categoryList, status: json["status"]);
  }
}

class ListOfCategoryByMenu {
  bool status;
  List<Category> mandatory;
  List<Category> choice;


  ListOfCategoryByMenu({required this.mandatory, required this.status, required this.choice});

  factory ListOfCategoryByMenu.fromJson(Map<String, dynamic> json){
    var listMandatory = json["mandatory"] as List;
    List<Category> mandatoryList = listMandatory.map((i) => Category.fromJson(i)).toList();

    var listChoice = json["choice"] as List;
    List<Category> choiceList = listChoice.map((i) => Category.fromJson(i)).toList();

    return ListOfCategoryByMenu(status: json["status"], choice: choiceList, mandatory: mandatoryList);
  }
}
class DetailCategory {
  bool status;
  Category data;

  DetailCategory({required this.status, required this.data});

  factory DetailCategory.fromJson(Map<String, dynamic> json){
    return DetailCategory(status: json["status"], data: Category.fromJson(json["data"]));
  }
}

class Category {
  int idCategory;
  String category;
  String keterangan;
  Menu menu;

  Category({required this.idCategory, required this.category, required this.keterangan, required this.menu});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(idCategory: json["id_category"], category: json["category"], keterangan: json["keterangan"],menu: Menu.fromJson(json["menu"]));
  }
}

class Menu {
  int idMenu;
  String menu;
  
  Menu({required this.idMenu, required this.menu});
  
  factory Menu.fromJson(Map<String, dynamic> json){
    return Menu(idMenu: json["id_menu"], menu: json["menu"]);
  }
}


class ListOfMenu {
  bool status;
  List<Menu> menu;

  ListOfMenu({required this.menu, required this.status});

  factory ListOfMenu.fromJson(Map<String, dynamic> json){
    var listMenu = json["data"] as List;
    List<Menu> menuList = listMenu.map((i) => Menu.fromJson(i)).toList();

    return ListOfMenu(menu: menuList, status: json["status"]);
  }
}