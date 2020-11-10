import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/helper/constants.dart';

class Config {
  final String appName;
  final String apiBaseUrl;
  final bool apiLogging;
  final bool diagnostic;

  Config({
    @required this.appName,
    @required this.apiBaseUrl,
    this.apiLogging = false,
    this.diagnostic = false,
  })  : assert(appName != null),
        assert(apiBaseUrl != null);
}

class AppConfig extends InheritedWidget {
  final Config config;

  AppConfig({
    @required this.config,
    @required Widget child,
  })  : assert(config != null),
        super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

devConfig() => Config(
      appName: 'GameTv [DEV]',
      apiBaseUrl: Constants.apiBaseUrl,
      apiLogging: true,
      diagnostic: true,
    );
