part of 'model.dart';

class FindUser {
  bool status;
  User data;

  FindUser({required this.status, required this.data});

  factory FindUser.fromJson(Map<String, dynamic> json){
    return FindUser(status: json["status"], data: User.fromJson(json["data"]));
  }
}

class User {
  int id_user;
  String firstname;
  String lastname;
  String phone;
  String email;
  String username;
  String profesi;
  String profile_picture;
  String validasi_one;
  String validasi_two;
  Role role;

  User({required this.username, required this.email, required this.firstname, required this.phone, required this.lastname, required this.role, required this.id_user, required this.profesi, required this.profile_picture, required this.validasi_one, required this.validasi_two});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        username: json["username"],
        email: json["email"],
        firstname: json["firstname"],
        phone: json["phone"],
        lastname: json["lastname"],
        role: Role.fromJson(json["role"]),
        id_user: json["id_user"],
        profesi: json["profesi"],
        profile_picture: json["profile_picture"],
        validasi_one: json["validasi_one"],
        validasi_two: json["validasi_two"]
    );
  }
}

class UserLoginSuccess {
  bool status;
  String message;
  String token;
  User user;

  UserLoginSuccess({required this.status, required this.message, required this.token, required this.user});

  factory UserLoginSuccess.fromJson(Map<String, dynamic> json){
    return UserLoginSuccess(status: json["status"], message: json["message"], token: json["token"], user: User.fromJson(json["user"]));
  }
}

class UserLoginError {
  bool status;
  String message;

  UserLoginError({required this.status, required this.message});

  factory UserLoginError.fromJson(Map<String, dynamic> json){
    return UserLoginError(status: json["status"], message: json["message"]);
  }
}


class UserRegisterSuccess {
  bool status;
  String message;
  UserRegisterSuccess({required this.message, required this.status});

  factory UserRegisterSuccess.fromJson(Map<String, dynamic> json){
    return UserRegisterSuccess(message: json["message"], status: json["status"]);
  }
}

class UserRegisterError {
  bool status;
  String message;
  UserRegisterError({required this.message, required this.status});

  factory UserRegisterError.fromJson(Map<String, dynamic> json){
    return UserRegisterError(message: json["message"], status: json["status"]);
  }
}