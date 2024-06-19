part of 'service.dart';

class ServiceAdminCategory {
  static Future<ListOfCategory> readAllCategory() async {
    var response = await http.get(Uri.parse(Endpoint.categoryRead));
    switch(response.statusCode){
      case 200 :
        return ListOfCategory.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<ListOfCategoryByMenu> readAllCategoryByMenu() async {
    var response = await http.get(Uri.parse(Endpoint.categoryByMenu));
    switch(response.statusCode){
      case 200 :
        return ListOfCategoryByMenu.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<DetailCategory> readDetailCategory({String id="5"}) async {
    var response = await http.get(Uri.parse("http://10.0.2.2:7000/category/readDetailCategory/$id"));
    switch(response.statusCode){
      case 200 :
        return DetailCategory.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> addCategory(String category, String keterangan, String idMenu) async {
    final response = await http.post(
        Uri.parse(Endpoint.categoryAdd),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "category" : category,
          "keterangan" : keterangan,
          "idMenu" : idMenu
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> deleteCategory({String id="5"}) async{
    final response = await http.delete(
      Uri.parse("http://10.0.2.2:7000/category/deleteCategory/$id"),
      headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<Message> updateCategory(String category, String keterangan, String idMenu,{String id="5"}) async {
    final response = await http.put(
        Uri.parse("http://10.0.2.2:7000/category/updateCategory/$id"),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "category" : category,
          "keterangan" : keterangan,
          "idMenu" : idMenu
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400 :
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<ListOfMenu> readAllMenu() async {
    var response = await http.get(Uri.parse(Endpoint.readMenu));
    switch(response.statusCode){
      case 200 :
        return ListOfMenu.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }
}