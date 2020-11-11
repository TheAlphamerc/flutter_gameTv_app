import 'dart:convert';

class UserModel {
  UserModel({
    this.userName,
    this.name,
    this.avatar,
    this.password,
    this.rating,
    this.played,
    this.won,
    this.percentage,
  });

  final String userName;
  final String name;
  final String avatar;
  final String password;
  final int rating;
  final int played;
  final int won;
  final int percentage;

  UserModel copyWith({
    String userName,
    String name,
    String avatar,
    String password,
    int rating,
    int played,
    int won,
    int percentage,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        password: password ?? this.password,
        rating: rating ?? this.rating,
        played: played ?? this.played,
        won: won ?? this.won,
        percentage: percentage ?? this.percentage,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"] == null ? null : json["userName"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        password: json["password"] == null ? null : json["password"],
        percentage: json["percentage"] == null ? null : json["percentage"],
        played: json["played"] == null ? null : json["played"],
        rating: json["rating"] == null ? null : json["rating"],
        won: json["won"] == null ? null : json["won"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName == null ? null : userName,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "password": password == null ? null : password,
        "percentage": percentage == null ? null : percentage,
        "played": played == null ? null : played,
        "rating": rating == null ? null : rating,
        "won": won == null ? null : won,
      };
}
