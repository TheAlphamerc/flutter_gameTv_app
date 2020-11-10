import 'package:flutter_game_tournaments_app/model/tournament_model.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';

abstract class ApiGateway {
  Future<UserModel> login(UserModel model);
  Future<TournamentsResponse> getTournaments(String cursor);
}
