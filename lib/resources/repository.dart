import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway.dart';

class Repository {
  final ApiGateway apiGateway;
  Repository(this.apiGateway);

  Future<UserModel> login(model) {
    return apiGateway.login(model);
  }
}
