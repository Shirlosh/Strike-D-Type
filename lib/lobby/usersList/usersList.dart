import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/lobby/usersList/userTab.dart';

class UsersList extends StatefulWidget {
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<String> usersList = [Username];

  @override
  void initState() {
    super.initState();
    GameMode.listenOnParticipates(_changeUsersList);
  }

  void _changeUsersList(usersList) {
    if (this.mounted) {
      setState(() {
        this.usersList = usersList;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < usersList.length; i++)
          UserTab(usersList[i])
      ],
    );
  }
}
