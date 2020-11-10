class Constants {
  static const String apiBaseUrl =
      "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/";
  static const tournamentList = "tournaments_list_v2";

  static String tournaments(String cursor) {
    var endpoint = "$tournamentList?limit=10&status=all";
    if (cursor != null) {
      endpoint = endpoint + "&cursor=$cursor";
    }
    return endpoint;
  }
}
