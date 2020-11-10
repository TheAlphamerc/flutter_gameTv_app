import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/localization/app_localizations.dart';

enum Labels {
  username,
  password,
}

class KValidator {
  static Function(String) buildValidators(BuildContext context, Labels choice) {
    final locale = AppLocalizations.of(context);

    Function(String) nameValidators = (String value) {
      if (value.isEmpty) {
        return locale.translate("fieldEmptyText");
      }
      if (value.length > 10) {
        return locale.translate("nameMustBeLessThan");
      }
      if (value.length < 3) {
        return locale.translate("nameShouldBeAtleast");
      }
    };

    Function(String) passwordValidators = (String value) {
      if (value.isEmpty) {
        return locale.translate("fieldEmptyText");
      }
      if (value.length > 10) {
        return locale.translate("passwordMustLessThan");
      }
      if (value.length < 3) {
        return locale.translate("passwordShouldBeAtleast");
      }

      return null;
    };

    if (choice == Labels.username) return nameValidators;
    if (choice == Labels.password) return passwordValidators;

    return nameValidators;
  }

  static Function(String) otpValidators = (String value) {
    if (value.isEmpty) {
      return "";
    }
  };
}
