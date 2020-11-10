import 'package:flutter_game_tournaments_app/helper/constants.dart';
import 'package:flutter_game_tournaments_app/helper/share_prefrence_helprer.dart';
import 'package:flutter_game_tournaments_app/model/tournament_model.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/dio_client.dart';
import 'package:flutter_game_tournaments_app/resources/exceptions.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;
  final SharedPrefrenceHelper pref;
  ApiGatewayImpl(this._dioClient, {this.pref});

  @override
  Future<UserModel> login(UserModel model) async {
    await Future.delayed(Duration(seconds: 3));
    if (model.userName == "9898989898" && model.password == "password12") {
      return model.copyWith(
          avatar: "assets/user_1.jpg",
          name: "Simon Baker",
          userName: "FlyingWolf");
    } else if (model.userName == "9876543210" &&
        model.password == "password123") {
      return model.copyWith(
          avatar: "assets/user_2.jpg", name: "John Doe", userName: "Rynalolf");
    } else {
      throw UnauthorisedException("Invalid userName and password");
    }
  }

  @override
  Future<TournamentsResponse> getTournaments(String cursor) async {
    try {
      var response = await _dioClient.get(Constants.tournaments(cursor));
      var map = _dioClient.getJsonBody(response);

      return TournamentsResponse.fromJson(map["data"]);
    } catch (error) {
      throw error;
    }
  }
}
