import 'package:flutter/material.dart';

class Config {
  final String appName;
  final String apiBaseUrl;
  final bool apiLogging;
  final String appToken;
  final bool diagnostic;

  Config({
    @required this.appName,
    @required this.apiBaseUrl,
    @required this.appToken,
    this.apiLogging = false,
    this.diagnostic = false,
  })  : assert(appName != null),
        assert(apiBaseUrl != null);

  Config copyWith({
    appName,
    apiBaseUrl,
    apiLogging,
    diagnostic,
    appToken,
  }) {
    return Config(
      appName: appName ?? this.appName,
      apiBaseUrl: apiBaseUrl ?? this.apiBaseUrl,
      apiLogging: apiLogging ?? this.apiLogging,
      diagnostic: diagnostic ?? this.diagnostic,
      appToken: appToken ?? this.appToken,
    );
  }
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
      apiBaseUrl: "Constants.developmentBaseUrl",
      appToken: '',
      apiLogging: true,
      diagnostic: true,
    );
