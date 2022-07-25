import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import 'package:strike_d_type/game_page/components/statusBoard/modes/TimerMode.dart';
import 'package:strike_d_type/game_page/components/statusBoard/statusBoard.dart';
import '../../backend/handle-req.dart';

class Board extends StatelessWidget {
  Board(this.gameID)
  {
    prepareGameBeforeStart(gameID);
    isRunning = true;
  }

  final cards = 2;
  final gameID;
  var mode = TimerMode();
  bool isRunning;
  @override
  Widget build(BuildContext context) {
     return  Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
           children:[StatusBoard(mode),
              GameCards(cards, mode.onIconClicked, gameID),
            ]);
  }
}
