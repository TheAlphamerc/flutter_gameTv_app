import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_tournaments_app/model/tournament_model.dart';
import 'package:flutter_game_tournaments_app/model/userModel.dart';
import 'package:flutter_game_tournaments_app/states/auth_state.dart';
import 'package:flutter_game_tournaments_app/states/home_state.dart';
import 'package:flutter_game_tournaments_app/ui/theme/theme.dart';
import 'package:flutter_game_tournaments_app/ui/widget/load_more_scroll_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static MaterialPageRoute getRoute() =>
      MaterialPageRoute(builder: (_) => HomePage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("Home page");
    Provider.of<HomeState>(context, listen: false).getTournaments();
  }

  Widget _userinfoSection(
    UserModel user,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(user.avatar),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.deepPurpleAccent)),
                  child: Row(
                    children: [
                      Text(
                        "2250",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.deepPurpleAccent),
                      ),
                      Text(
                        " Elo Rating",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.deepPurpleAccent, fontSize: 13),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _statics(UserModel model) {
    final theme = Theme.of(context);
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: AppTheme.fullWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.deepPurpleAccent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
                color: Colors.yellow[900],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.orange[700],
                    Colors.orange,
                  ],
                  stops: [0, .95],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("34",
                      style: theme.textTheme.headline6
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("Tournaments",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("played",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.deepPurple[800],
                    Colors.deepPurple[300],
                  ],
                  stops: [0, .95],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("09",
                      style: theme.textTheme.headline6
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("Tournaments",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("won",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.orange[900],
                    Colors.orange[600],
                  ],
                  stops: [0, .95],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("26",
                      style: theme.textTheme.headline6
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("Wining",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary)),
                  Text("percentage",
                      style: theme.textTheme.bodyText1
                          .copyWith(color: theme.colorScheme.onPrimary))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tournamentCard(Tournament model) {
    return Container(
      // height: 120,
      width: AppTheme.fullWidth(context),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: AppTheme.decoration(context)
          .copyWith(borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppTheme.fullWidth(context),
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      model.coverUrl,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 16)),
                  SizedBox(height: 10),
                  Text(model.details),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AuthState>(
      builder: (context, authState, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.short_text),
            title: Text(authState.user?.userName ?? ""),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _userinfoSection(authState.user),
                SizedBox(height: 10),
                _statics(authState.user),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Recomended for you",
                      style: theme.textTheme.headline5),
                ),
                Expanded(
                  child: Container(
                    child: Consumer<HomeState>(
                      builder: (context, state, child) {
                        if (state.isBusy) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state.tournaments == null) {
                          return Center(child: Text("Error"));
                        } else {
                          return LoadMoreScrollView(
                            isLoading: state.isBusy,
                            onEndOfPage: () async {
                              await state.getTournaments();
                            },
                            child: ListView.builder(
                                itemCount: state.tournaments.length,
                                itemBuilder: (context, index) {
                                  return _tournamentCard(
                                      state.tournaments[index]);
                                }),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
