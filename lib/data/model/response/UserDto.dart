import 'package:ecommerce/domain/entity/UserEntity.dart';
import 'package:ecommerce/domain/entity/auth_result_entity.dart';

/// message : "success"
/// user : {"name":"atefatef","email":"atefatef@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGQ0YzAzODA3YjI5NTNmN2E5ZmViZiIsIm5hbWUiOiJhdGVmYXRlZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NTY0NTQ4LCJleHAiOjE3MDczNDA1NDh9.wvqFTk9OxBqPog6aCxJhCS7AzuBY9siT4BrHt8uj34I"



/// name : "atefatef"
/// email : "atefatef@gmail.com"
/// role : "user"

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,});

  UserDto.fromJson(dynamic json) {
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

  toUserEntity() {
    return UserEntity(
      email: email,
      name: name
    );
  }

}