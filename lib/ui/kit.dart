import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/model/language_model.dart';
import 'package:flutter_game_tournaments_app/states/app_language_state.dart';

class Alert {
  static List<LanguageData> languages = [
    LanguageData(languageCode: "en", languageName: "English"),
    LanguageData(languageCode: "ja", languageName: "Japaneese"),
  ];
  static displayLanguageBox(
      BuildContext context, AppLanguageState appLanguage) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Select Language")),
            content: Container(
                width: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                                onTap: () async {
                                  appLanguage.changeLanguage(
                                      Locale(languages[i].languageCode));
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(languages[i].languageName),
                                    appLanguage.languageCodeSaved ==
                                            languages[i].languageCode
                                        ? Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.blue,
                                          )
                                        : Icon(
                                            Icons.radio_button_unchecked,
                                            color: Colors.blue,
                                          ),
                                  ],
                                )),
                            Divider()
                          ],
                        ),
                      );
                    })),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  static void sucess(BuildContext context,
      {String message, String title, double height = 150}) async {
    final theme = Theme.of(context);
    await showDialog(
      context: context,
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
          height: height, //MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 16),
              Text(
                message,
                style: Theme.of(context).typography.dense.bodyText2.copyWith(
                      color: Colors.black,
                    ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Theme.of(context).primaryColor,
                child: Text("OK",
                    style: theme.textTheme.button
                        .copyWith(color: theme.colorScheme.onPrimary)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
