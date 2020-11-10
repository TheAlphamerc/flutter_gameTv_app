import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_tournaments_app/states/app_language_state.dart';
import 'package:flutter_game_tournaments_app/states/auth_state.dart';
import 'package:flutter_game_tournaments_app/localization/app_localizations.dart';
import 'package:flutter_game_tournaments_app/localization/AppLanguage.dart';
import 'package:flutter_game_tournaments_app/states/home_state.dart';
import 'package:flutter_game_tournaments_app/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GameTvApp extends StatefulWidget {
  final Widget home;

  const GameTvApp({
    Key key,
    @required this.home,
  }) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _GameTvAppState state = context.findAncestorStateOfType<_GameTvAppState>();
    state.setLocale(newLocale);
  }

  @override
  _GameTvAppState createState() => _GameTvAppState();
}

class _GameTvAppState extends State<GameTvApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // @override
  // void didChangeDependencies() {
  //   getLocale().then((locale) {
  //     setState(() {
  //       this._locale = locale;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, //top bar color
    //   statusBarIconBrightness: Brightness.dark, //top bar icons
    // ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguageState>(
            create: (context) => AppLanguageState()),
        ChangeNotifierProvider<AuthState>(create: (context) => AuthState()),
        ChangeNotifierProvider<HomeState>(create: (context) => HomeState()),
      ],
      child: Consumer<AppLanguageState>(builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          locale: model.appLocal,
          supportedLocales: [
            const Locale('en'),
            const Locale('ja'),
          ],
          theme: AppTheme.lightTheme,
          home: widget.home,
        );
      }),
    );
  }
}
