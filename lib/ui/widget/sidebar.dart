import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/localization/app_localizations.dart';
import 'package:flutter_game_tournaments_app/states/app_language_state.dart';
import 'package:flutter_game_tournaments_app/states/auth_state.dart';
import 'package:flutter_game_tournaments_app/ui/kit.dart';
import 'package:flutter_game_tournaments_app/ui/pages/login_screen.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key key}) : super(key: key);
  String translate(BuildContext context, String title) =>
      AppLocalizations.of(context).translate(title);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appLanguage = Provider.of<AppLanguageState>(context, listen: false);
    return Drawer(
      child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset("assets/app_logo.png", width: 150),
          ),
          Divider(thickness: 1, height: 1),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Alert.displayLanguageBox(context, appLanguage);
            },
            title: Text(translate(context, "language")),
            leading: Icon(Icons.language),
          ),
          Divider(thickness: 1, height: 1),
          ListTile(
            onTap: () {
              Provider.of<AuthState>(context, listen: false).logout();
              Navigator.pushReplacement(context, LoginScreen.getRoute());
            },
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(translate(context, "logout"),
                style: TextStyle(color: Colors.red)),
          ),
          Divider(thickness: 1, height: 1),
        ],
      )),
    );
  }
}
