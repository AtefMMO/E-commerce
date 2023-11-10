/// message : "success"
/// user : {"name":"atefatef","email":"atefatef@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGQ0YzAzODA3YjI5NTNmN2E5ZmViZiIsIm5hbWUiOiJhdGVmYXRlZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NTY0NTQ4LCJleHAiOjE3MDczNDA1NDh9.wvqFTk9OxBqPog6aCxJhCS7AzuBY9siT4BrHt8uj34I"

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}

/// name : "atefatef"
/// email : "atefatef@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,

  });

  String? name;
  String? email;

}
