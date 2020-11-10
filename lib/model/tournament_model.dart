import 'dart:convert';

// class TournamentsResponse {
//     TournamentsResponse({
//         this.code,
//         this.data,
//         this.success,
//     });

//     final int code;
//     final Data data;
//     final bool success;

//     TournamentsResponse copyWith({
//         int code,
//         Data data,
//         bool success,
//     }) =>
//         TournamentsResponse(
//             code: code ?? this.code,
//             data: data ?? this.data,
//             success: success ?? this.success,
//         );

//     factory TournamentsResponse.fromRawJson(String str) => TournamentsResponse.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory TournamentsResponse.fromJson(Map<String, dynamic> json) => TournamentsResponse(
//         code: json["code"] == null ? null : json["code"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         success: json["success"] == null ? null : json["success"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code == null ? null : code,
//         "data": data == null ? null : data.toJson(),
//         "success": success == null ? null : success,
//     };
// }

class TournamentsResponse {
  TournamentsResponse({
    this.cursor,
    this.tournamentCount,
    this.tournaments,
    this.isLastBatch,
  });

  final String cursor;
  final dynamic tournamentCount;
  final List<Tournament> tournaments;
  final bool isLastBatch;

  TournamentsResponse copyWith({
    String cursor,
    int tournamentCount,
    List<Tournament> tournaments,
    bool isLastBatch,
  }) =>
      TournamentsResponse(
        cursor: cursor ?? this.cursor,
        tournamentCount: tournamentCount ?? this.tournamentCount,
        tournaments: tournaments ?? this.tournaments,
        isLastBatch: isLastBatch ?? this.isLastBatch,
      );

  factory TournamentsResponse.fromRawJson(String str) =>
      TournamentsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TournamentsResponse.fromJson(Map<String, dynamic> json) =>
      TournamentsResponse(
        cursor: json["cursor"] == null ? null : json["cursor"],
        tournamentCount: json["tournament_count"],
        tournaments: json["tournaments"] == null
            ? null
            : List<Tournament>.from(
                json["tournaments"].map((x) => Tournament.fromJson(x))),
        isLastBatch:
            json["is_last_batch"] == null ? null : json["is_last_batch"],
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor == null ? null : cursor,
        "tournament_count": tournamentCount,
        "tournaments": tournaments == null
            ? null
            : List<dynamic>.from(tournaments.map((x) => x.toJson())),
        "is_last_batch": isLastBatch == null ? null : isLastBatch,
      };
}

class Tournament {
  Tournament({
    this.isCheckInRequired,
    this.tournamentId,
    this.tournamentEnded,
    this.tournamentEndDate,
    this.areRandomTeamsAllowed,
    this.adminLocale,
    this.regEndDate,
    this.startDate,
    this.rules,
    this.maxTeams,
    this.tournamentUrl,
    this.prizes,
    this.matchStyleType,
    this.pwaUrl,
    this.tournamentType,
    this.geo,
    this.maxLevelId,
    this.isPasswordRequired,
    this.name,
    this.matchStyle,
    this.registrationUrl,
    this.gamePkg,
    this.isRegistrationOpen,
    this.isWaitlistEnabled,
    this.incompleteTeamsAllowed,
    this.isAutoResultAllowed,
    this.teamSize,
    this.status,
    this.isLevelsEnabled,
    this.dynamicAppUrl,
    this.minLevelId,
    this.gameFormat,
    this.details,
    this.gameIconUrl,
    this.regStartDate,
    this.coverUrl,
    this.bracketsUrl,
    this.tournamentSlug,
    this.discordUrl,
    this.gameId,
    this.resultSubmissionByAdmin,
    this.country,
    this.adminUsername,
    this.gameName,
    this.streamUrl,
  });

  final bool isCheckInRequired;
  final String tournamentId;
  final bool tournamentEnded;
  final String tournamentEndDate;
  final bool areRandomTeamsAllowed;
  final String adminLocale;
  final String regEndDate;
  final String startDate;
  final String rules;
  final int maxTeams;
  final String tournamentUrl;
  final String prizes;
  final String matchStyleType;
  final String pwaUrl;
  final String tournamentType;
  final String geo;
  final dynamic maxLevelId;
  final bool isPasswordRequired;
  final String name;
  final String matchStyle;
  final String registrationUrl;
  final dynamic gamePkg;
  final bool isRegistrationOpen;
  final bool isWaitlistEnabled;
  final bool incompleteTeamsAllowed;
  final bool isAutoResultAllowed;
  final int teamSize;
  final String status;
  final bool isLevelsEnabled;
  final String dynamicAppUrl;
  final dynamic minLevelId;
  final String gameFormat;
  final String details;
  final String gameIconUrl;
  final String regStartDate;
  final String coverUrl;
  final dynamic bracketsUrl;
  final String tournamentSlug;
  final String discordUrl;
  final String gameId;
  final bool resultSubmissionByAdmin;
  final String country;
  final String adminUsername;
  final String gameName;
  final String streamUrl;

  Tournament copyWith({
    bool isCheckInRequired,
    String tournamentId,
    bool tournamentEnded,
    String tournamentEndDate,
    bool areRandomTeamsAllowed,
    String adminLocale,
    String regEndDate,
    String startDate,
    String rules,
    int maxTeams,
    String tournamentUrl,
    String prizes,
    String matchStyleType,
    String pwaUrl,
    String tournamentType,
    String geo,
    dynamic maxLevelId,
    bool isPasswordRequired,
    String name,
    String matchStyle,
    String registrationUrl,
    dynamic gamePkg,
    bool isRegistrationOpen,
    bool isWaitlistEnabled,
    bool incompleteTeamsAllowed,
    bool isAutoResultAllowed,
    int teamSize,
    String status,
    bool isLevelsEnabled,
    String dynamicAppUrl,
    dynamic minLevelId,
    String gameFormat,
    String details,
    String gameIconUrl,
    String regStartDate,
    String coverUrl,
    dynamic bracketsUrl,
    String tournamentSlug,
    String discordUrl,
    String gameId,
    bool resultSubmissionByAdmin,
    String country,
    String adminUsername,
    String gameName,
    String streamUrl,
  }) =>
      Tournament(
        isCheckInRequired: isCheckInRequired ?? this.isCheckInRequired,
        tournamentId: tournamentId ?? this.tournamentId,
        tournamentEnded: tournamentEnded ?? this.tournamentEnded,
        tournamentEndDate: tournamentEndDate ?? this.tournamentEndDate,
        areRandomTeamsAllowed:
            areRandomTeamsAllowed ?? this.areRandomTeamsAllowed,
        adminLocale: adminLocale ?? this.adminLocale,
        regEndDate: regEndDate ?? this.regEndDate,
        startDate: startDate ?? this.startDate,
        rules: rules ?? this.rules,
        maxTeams: maxTeams ?? this.maxTeams,
        tournamentUrl: tournamentUrl ?? this.tournamentUrl,
        prizes: prizes ?? this.prizes,
        matchStyleType: matchStyleType ?? this.matchStyleType,
        pwaUrl: pwaUrl ?? this.pwaUrl,
        tournamentType: tournamentType ?? this.tournamentType,
        geo: geo ?? this.geo,
        maxLevelId: maxLevelId ?? this.maxLevelId,
        isPasswordRequired: isPasswordRequired ?? this.isPasswordRequired,
        name: name ?? this.name,
        matchStyle: matchStyle ?? this.matchStyle,
        registrationUrl: registrationUrl ?? this.registrationUrl,
        gamePkg: gamePkg ?? this.gamePkg,
        isRegistrationOpen: isRegistrationOpen ?? this.isRegistrationOpen,
        isWaitlistEnabled: isWaitlistEnabled ?? this.isWaitlistEnabled,
        incompleteTeamsAllowed:
            incompleteTeamsAllowed ?? this.incompleteTeamsAllowed,
        isAutoResultAllowed: isAutoResultAllowed ?? this.isAutoResultAllowed,
        teamSize: teamSize ?? this.teamSize,
        status: status ?? this.status,
        isLevelsEnabled: isLevelsEnabled ?? this.isLevelsEnabled,
        dynamicAppUrl: dynamicAppUrl ?? this.dynamicAppUrl,
        minLevelId: minLevelId ?? this.minLevelId,
        gameFormat: gameFormat ?? this.gameFormat,
        details: details ?? this.details,
        gameIconUrl: gameIconUrl ?? this.gameIconUrl,
        regStartDate: regStartDate ?? this.regStartDate,
        coverUrl: coverUrl ?? this.coverUrl,
        bracketsUrl: bracketsUrl ?? this.bracketsUrl,
        tournamentSlug: tournamentSlug ?? this.tournamentSlug,
        discordUrl: discordUrl ?? this.discordUrl,
        gameId: gameId ?? this.gameId,
        resultSubmissionByAdmin:
            resultSubmissionByAdmin ?? this.resultSubmissionByAdmin,
        country: country ?? this.country,
        adminUsername: adminUsername ?? this.adminUsername,
        gameName: gameName ?? this.gameName,
        streamUrl: streamUrl ?? this.streamUrl,
      );

  factory Tournament.fromRawJson(String str) =>
      Tournament.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        isCheckInRequired: json["is_check_in_required"] == null
            ? null
            : json["is_check_in_required"],
        tournamentId:
            json["tournament_id"] == null ? null : json["tournament_id"],
        tournamentEnded:
            json["tournament_ended"] == null ? null : json["tournament_ended"],
        tournamentEndDate: json["tournament_end_date"] == null
            ? null
            : json["tournament_end_date"],
        areRandomTeamsAllowed: json["are_random_teams_allowed"] == null
            ? null
            : json["are_random_teams_allowed"],
        adminLocale: json["admin_locale"] == null ? null : json["admin_locale"],
        regEndDate: json["reg_end_date"] == null ? null : json["reg_end_date"],
        startDate: json["start_date"] == null ? null : json["start_date"],
        rules: json["rules"] == null ? null : json["rules"],
        maxTeams: json["max_teams"] == null ? null : json["max_teams"],
        tournamentUrl:
            json["tournament_url"] == null ? null : json["tournament_url"],
        prizes: json["prizes"] == null ? null : json["prizes"],
        matchStyleType:
            json["match_style_type"] == null ? null : json["match_style_type"],
        pwaUrl: json["pwa_url"] == null ? null : json["pwa_url"],
        tournamentType:
            json["tournament_type"] == null ? null : json["tournament_type"],
        geo: json["geo"] == null ? null : json["geo"],
        maxLevelId: json["max_level_id"],
        isPasswordRequired: json["is_password_required"] == null
            ? null
            : json["is_password_required"],
        name: json["name"] == null ? null : json["name"],
        matchStyle: json["match_style"] == null ? null : json["match_style"],
        registrationUrl:
            json["registration_url"] == null ? null : json["registration_url"],
        gamePkg: json["game_pkg"],
        isRegistrationOpen: json["is_registration_open"] == null
            ? null
            : json["is_registration_open"],
        isWaitlistEnabled: json["is_waitlist_enabled"] == null
            ? null
            : json["is_waitlist_enabled"],
        incompleteTeamsAllowed: json["incomplete_teams_allowed"] == null
            ? null
            : json["incomplete_teams_allowed"],
        isAutoResultAllowed: json["is_auto_result_allowed"] == null
            ? null
            : json["is_auto_result_allowed"],
        teamSize: json["team_size"] == null ? null : json["team_size"],
        status: json["status"] == null ? null : json["status"],
        isLevelsEnabled: json["is_levels_enabled"] == null
            ? null
            : json["is_levels_enabled"],
        dynamicAppUrl:
            json["dynamic_app_url"] == null ? null : json["dynamic_app_url"],
        minLevelId: json["min_level_id"],
        gameFormat: json["game_format"] == null ? null : json["game_format"],
        details: json["details"] == null ? null : json["details"],
        gameIconUrl:
            json["game_icon_url"] == null ? null : json["game_icon_url"],
        regStartDate:
            json["reg_start_date"] == null ? null : json["reg_start_date"],
        coverUrl: json["cover_url"] == null ? null : json["cover_url"],
        bracketsUrl: json["brackets_url"],
        tournamentSlug:
            json["tournament_slug"] == null ? null : json["tournament_slug"],
        discordUrl: json["discord_url"] == null ? null : json["discord_url"],
        gameId: json["game_id"] == null ? null : json["game_id"],
        resultSubmissionByAdmin: json["result_submission_by_admin"] == null
            ? null
            : json["result_submission_by_admin"],
        country: json["country"] == null ? null : json["country"],
        adminUsername:
            json["admin_username"] == null ? null : json["admin_username"],
        gameName: json["game_name"] == null ? null : json["game_name"],
        streamUrl: json["stream_url"] == null ? null : json["stream_url"],
      );

  Map<String, dynamic> toJson() => {
        "is_check_in_required":
            isCheckInRequired == null ? null : isCheckInRequired,
        "tournament_id": tournamentId == null ? null : tournamentId,
        "tournament_ended": tournamentEnded == null ? null : tournamentEnded,
        "tournament_end_date":
            tournamentEndDate == null ? null : tournamentEndDate,
        "are_random_teams_allowed":
            areRandomTeamsAllowed == null ? null : areRandomTeamsAllowed,
        "admin_locale": adminLocale == null ? null : adminLocale,
        "reg_end_date": regEndDate == null ? null : regEndDate,
        "start_date": startDate == null ? null : startDate,
        "rules": rules == null ? null : rules,
        "max_teams": maxTeams == null ? null : maxTeams,
        "tournament_url": tournamentUrl == null ? null : tournamentUrl,
        "prizes": prizes == null ? null : prizes,
        "match_style_type": matchStyleType == null ? null : matchStyleType,
        "pwa_url": pwaUrl == null ? null : pwaUrl,
        "tournament_type": tournamentType == null ? null : tournamentType,
        "geo": geo == null ? null : geo,
        "max_level_id": maxLevelId,
        "is_password_required":
            isPasswordRequired == null ? null : isPasswordRequired,
        "name": name == null ? null : name,
        "match_style": matchStyle == null ? null : matchStyle,
        "registration_url": registrationUrl == null ? null : registrationUrl,
        "game_pkg": gamePkg,
        "is_registration_open":
            isRegistrationOpen == null ? null : isRegistrationOpen,
        "is_waitlist_enabled":
            isWaitlistEnabled == null ? null : isWaitlistEnabled,
        "incomplete_teams_allowed":
            incompleteTeamsAllowed == null ? null : incompleteTeamsAllowed,
        "is_auto_result_allowed":
            isAutoResultAllowed == null ? null : isAutoResultAllowed,
        "team_size": teamSize == null ? null : teamSize,
        "status": status == null ? null : status,
        "is_levels_enabled": isLevelsEnabled == null ? null : isLevelsEnabled,
        "dynamic_app_url": dynamicAppUrl == null ? null : dynamicAppUrl,
        "min_level_id": minLevelId,
        "game_format": gameFormat == null ? null : gameFormat,
        "details": details == null ? null : details,
        "game_icon_url": gameIconUrl == null ? null : gameIconUrl,
        "reg_start_date": regStartDate == null ? null : regStartDate,
        "cover_url": coverUrl == null ? null : coverUrl,
        "brackets_url": bracketsUrl,
        "tournament_slug": tournamentSlug == null ? null : tournamentSlug,
        "discord_url": discordUrl == null ? null : discordUrl,
        "game_id": gameId == null ? null : gameId,
        "result_submission_by_admin":
            resultSubmissionByAdmin == null ? null : resultSubmissionByAdmin,
        "country": country == null ? null : country,
        "admin_username": adminUsername == null ? null : adminUsername,
        "game_name": gameName == null ? null : gameName,
        "stream_url": streamUrl == null ? null : streamUrl,
      };
}
