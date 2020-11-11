import 'package:flutter_game_tournaments_app/helper/share_prefrence_helprer.dart';
import 'package:flutter_game_tournaments_app/model/tournament_model.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway.dart';

class Repository {
  final ApiGateway apiGateway;
  final SharedPrefrenceHelper pref;
  Repository(this.apiGateway, this.pref);

  Future<UserModel> login(model) async {
    var user = await apiGateway.login(model);
    await pref.saveUserProfile(user);
    return user;
  }

  Future<TournamentsResponse> getTournaments(String cursor) {
    return apiGateway.getTournaments(cursor);
  }
}
