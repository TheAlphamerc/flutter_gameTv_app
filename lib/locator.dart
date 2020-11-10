import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_game_tournaments_app/config/config.dart';
import 'package:flutter_game_tournaments_app/helper/share_prefrence_helprer.dart';
import 'package:flutter_game_tournaments_app/resources/dio_client.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway.dart';
import 'package:flutter_game_tournaments_app/resources/gateway/api_gatway_impl.dart';
import 'package:flutter_game_tournaments_app/resources/repository.dart';
import 'package:get_it/get_it.dart';

void setUpDependency(Config config) {
  final serviceLocator = GetIt.instance;

  serviceLocator
      .registerSingleton<SharedPrefrenceHelper>(SharedPrefrenceHelper());

  serviceLocator.registerSingleton<ApiGateway>(
    ApiGatewayImpl(
      DioClient(Dio(), baseEndpoint: config.apiBaseUrl, logging: true),
      pref: GetIt.instance<SharedPrefrenceHelper>(),
    ),
  );
  serviceLocator.registerSingleton(Repository(
    GetIt.instance<ApiGateway>(),
    GetIt.instance<SharedPrefrenceHelper>(),
  ));
}
