import 'package:flutter_game_tournaments_app/helper/share_prefrence_helprer.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/resources/dio_client.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;
  final SharedPrefrenceHelper pref;
  ApiGatewayImpl(this._dioClient, {this.pref});

  @override
  Future<UserModel> login(UserModel model) async {
    await Future.delayed(Duration(seconds: 3));
    return UserModel(
      name: "Rohn",
    );
  }
}
