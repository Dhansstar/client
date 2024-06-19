part of 'service.dart';

class ServiceRole {

  static Future<ReadRole> readRole() async {
    var response = await http.get(
        Uri.parse("http://10.0.2.2:7000/role")
    );

    switch(response.statusCode){
      case 200 :
        return ReadRole.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }
}