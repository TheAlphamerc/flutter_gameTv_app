import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/app.dart';
import 'package:flutter_game_tournaments_app/config/config.dart';
import 'package:flutter_game_tournaments_app/locator.dart';
import 'package:flutter_game_tournaments_app/ui/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = GameTvApp(home: SplashPage());

  final config = devConfig();
  setUpDependency(config);

  runApp(app);
}
