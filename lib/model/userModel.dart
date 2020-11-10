import 'dart:convert';

class UserModel {
  UserModel({
    this.userName,
    this.name,
    this.avatar,
    this.password,
  });

  final String userName;
  final String name;
  final String avatar;
  final String password;

  UserModel copyWith({
    String userName,
    String name,
    String avatar,
    String password,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        password: password ?? this.password,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"] == null ? null : json["userName"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName == null ? null : userName,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "password": password == null ? null : password,
      };
}
