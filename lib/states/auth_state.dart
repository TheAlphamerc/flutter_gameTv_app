import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/repository.dart';
import 'package:get_it/get_it.dart';

class AuthState extends ChangeNotifier {
  String username;
  String password;
  String mobile;
  UserModel user;
  set setEmail(String value) {
    username = value;
  }

  set setPassword(String value) {
    password = value;
  }

  Future<UserModel> login() async {
    try {
      var model = UserModel(
        userName: username,
        password: password,
      );
      final getit = GetIt.instance;
      final repo = getit.get<Repository>();
      user = await repo.login(model);
      return user;
    } catch (error, strackTrace) {
      log("error", error: error);
      return null;
    }
  }
}
