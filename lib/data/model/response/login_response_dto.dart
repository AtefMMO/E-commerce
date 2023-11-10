import 'package:ecommerce/data/model/response/UserDto.dart';

import '../../../domain/entity/auth_result_entity.dart';

/// message : "success"
/// user : {"name":"atefatef","email":"atefatef@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGQ0YzAzODA3YjI5NTNmN2E5ZmViZiIsIm5hbWUiOiJhdGVmYXRlZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NTc5NTY2LCJleHAiOjE3MDczNTU1NjZ9.Yd9aNU7UDfVUWHP881HnMlbVexgwD9nVfxDVmA3vwxo"
class LoginResponseDto {
  LoginResponseDto({this.message, this.user, this.token, this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }
}

/// name : "atefatef"
/// email : "atefatef@gmail.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
