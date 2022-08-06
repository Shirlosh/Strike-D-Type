import 'package:flutter/material.dart';

import '../../../application/Globals.dart';
import '../../../application/modes/PvPMode.dart';
import '../../../lobby/lobby_widget.dart';

Future<void> GameIDPopup(context) async {

  await showDialog<bool>(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('Arena code'),
        //todo:need to do something with this input https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
        content: TextField(
        onChanged: (value) { GameID = value; },
          decoration: InputDecoration(
              hintText:
              "ID"),
        ),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.pop(alertDialogContext, false),
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () =>{
              print(GameID),
              Navigator.pop( alertDialogContext, true),
                Navigator.push(context, MaterialPageRoute(builder: (context) => LobbyWidget(PvPMode(), false)))
            },
            child: Text('Confirm'),
          ),
        ],
      );
    });
  }
