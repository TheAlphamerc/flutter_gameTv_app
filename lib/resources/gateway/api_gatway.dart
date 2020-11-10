import 'package:flutter_game_tournaments_app/model/userModel.dart';

abstract class ApiGateway {
  Future<UserModel> login(UserModel model);
}
