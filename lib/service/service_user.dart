part of 'service.dart';

class ServiceUser {

  static Future<ApiReturnValue> registerUser(String firstname, String lastname, String username, String password, String idRole, String validationOne, String validationTwo) async {
    final response = await http.post(
        Uri.parse(Endpoint.apiRegister),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "firstname" : firstname,
          "lastname" : lastname,
          "username" : username,
          "password" : password,
          "role" : idRole,
          "validationOne" : validationOne,
          "validationTwo" : validationTwo
        })
    );

    switch(response.statusCode){
      case 200:
        return ApiReturnValue(value: UserRegisterSuccess.fromJson(jsonDecode(response.body)));
      case 400:
        return ApiReturnValue(value: UserRegisterError.fromJson(jsonDecode(response.body)));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<ApiReturnValue> loginUser(String username, String password) async {
    final response = await http.post(
        Uri.parse(Endpoint.apiLogin),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "username" : username,
          "password" : password
        })
    );

    switch(response.statusCode){
      case 200:
        return ApiReturnValue(value: UserLoginSuccess.fromJson(jsonDecode(response.body)));
      case 400:
        return ApiReturnValue(value: UserLoginError.fromJson(jsonDecode(response.body)));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<FindUser> findUser(String id, String token) async {
    final response = await http.get(
        Uri.parse(Endpoint.apiFindUser+id),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
          'Accept': 'application/json',
          'Authorization': token,
        },
    );

    switch(response.statusCode){
      case 200:
        return FindUser.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }


  static Future<Message> updateUser(String firstname, String lastname, String username, String email, String phone, String profesi, String id,String idRole, String validationOne, String validationTwo) async {
    final response = await http.put(
        Uri.parse(Endpoint.apiUploadUser+id),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "firstname" : firstname,
          "lastname" : lastname,
          "username" : username,
          "email" : email,
          "phone" : phone,
          "profesi" : profesi,
          "role" : idRole,
          "validationOne" : validationOne,
          "validationTwo" : validationTwo
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400:
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }

  static Future<dynamic> uploadFile(filePath, String id) async {
    try {
      var formData = FormData.fromMap({
        'profile_picture': await MultipartFile.fromFile(filePath),
      });

      Response response = await Dio().put(Endpoint.apiUpdateUser+id, data: formData);
      return response;
    }on DioError catch (e) {
      return e.response;
    } catch(e){
    }
  }

  static Future<Message> forgetPassword(String username, String validationOne, String validationTwo, String password) async {
    final response = await http.post(
        Uri.parse(Endpoint.apiForgetPassword),
        headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "username" : username,
          "validasi_one" : validationOne,
          "validasi_two" : validationTwo,
          "password" : password
        })
    );

    switch(response.statusCode){
      case 200:
        return Message.fromJson(jsonDecode(response.body));
      case 400:
        return Message.fromJson(jsonDecode(response.body));
      default:
        throw Exception('Failed to create album.');
    }
  }
}