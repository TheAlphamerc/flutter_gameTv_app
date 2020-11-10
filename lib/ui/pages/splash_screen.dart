import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/helper/share_prefrence_helprer.dart';
import 'package:flutter_game_tournaments_app/ui/pages/login_screen.dart';
import 'package:get_it/get_it.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      doAutoLogin();
    });
    super.initState();
  }

  void doAutoLogin() async {
    final getIt = GetIt.instance;
    final prefs = getIt<SharedPrefrenceHelper>();
    final accessToken = await prefs.getUserProfile();
    if (accessToken != null) {
      print("***************** Auto Login ***********************");
      Navigator.of(context)
          .pushAndRemoveUntil(HomePage.getRoute(), (_) => false);
    } else {
      Navigator.pushReplacement(context, LoginScreen.getRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/app_logo.png",
          width: MediaQuery.of(context).size.width * 0.80,
        ),
      ),
    );
  }
}
