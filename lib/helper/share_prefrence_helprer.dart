import 'dart:convert';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  SharedPrefrenceHelper._internal();
  static final SharedPrefrenceHelper _singleton =
      SharedPrefrenceHelper._internal();

  factory SharedPrefrenceHelper() {
    return _singleton;
  }

  Future<Null> cleaPrefrenceValues() async {
    await (SharedPreferences.getInstance())
      ..clear();
  }

  Future<void> saveUserProfile(UserModel user) async {
    return (await SharedPreferences.getInstance()).setString(
        UserPreferenceKey.UserProfile.toString(), json.encode(user.toJson()));
  }

  Future<UserModel> getUserProfile() async {
    final jsonString = (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.UserProfile.toString());
    if (jsonString == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(jsonString));
  }
}

enum UserPreferenceKey {
  LanguageCode,
  CountryISOCode,
  UserProfile,
}
