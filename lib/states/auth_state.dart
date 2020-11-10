import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/repository.dart';
import 'package:get_it/get_it.dart';

class AuthState extends ChangeNotifier {
  String username;
  String _password;
  UserModel user;
  set setUserName(String value) {
    username = value;
  }

  set setPassword(String value) {
    _password = value;
  }

  set setUser(UserModel model) {
    user = model;
    notifyListeners();
  }

  Future<UserModel> login() async {
    try {
      var model = UserModel(
        userName: username,
        password: _password,
      );
      final getit = GetIt.instance;
      final repo = getit.get<Repository>();
      user = await repo.login(model);
      return user;
    } catch (error) {
      log("error", error: error);
      return null;
    }
  }
}
