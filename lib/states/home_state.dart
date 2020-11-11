import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/model/tournament_model.dart';
import 'package:flutter_game_tournaments_app/resources/repository.dart';
import 'package:get_it/get_it.dart';

class HomeState extends ChangeNotifier {
  List<Tournament> tournaments;
  bool hasMore = true;
  bool isBusy = false;
  String cursor;

  Future getTournaments() async {
    try {
      if (!hasMore) {
        log("Not enough tournaments remaining");
        return;
      }
      if (isBusy) {
        print("Wait  for result");
        return;
      }
      isBusy = true;
      print("Api calling");

      final getit = GetIt.instance;
      final repo = getit.get<Repository>();
      var responseModel = await repo.getTournaments(cursor);
      cursor = responseModel.cursor;
      hasMore = !responseModel.isLastBatch;
      if (cursor == null) {
        tournaments = responseModel.tournaments;
      } else {
        tournaments ??= [];
        tournaments.addAll(responseModel.tournaments);
      }

      isBusy = false;
      notifyListeners();
    } catch (error, strackTrace) {
      log(error.toString(), stackTrace: strackTrace);
    }
  }
}
