part of 'model.dart';

class ReadRole {
  bool status;
  List<Role> dataRole;

  ReadRole({required this.status, required this.dataRole});

  factory ReadRole.fromJson(Map<String, dynamic> json){
    var listRole = json["data"] as List;
    List<Role> roleList = listRole.map((e) => Role.fromJson(e)).toList();
    return ReadRole(status: json["status"], dataRole: roleList);
  }
}

class Role {
  int idRole;
  String loginType;

  Role({required this.idRole, required this.loginType});

  factory Role.fromJson(Map<String, dynamic> json){
    return Role(idRole: json["id_role"], loginType: json["login_type"]);
  }
}