import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import 'package:strike_d_type/game_page/components/statusBoard/statusBoard.dart';

class Board extends StatelessWidget {
  Board() {
    //isRunning = true;
    //boardType = GameMode.getStatusBoardContent();
  }

  final cards = 2;
  final boardType = GameMode.getStatusBoardContent();
  //bool isRunning;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatusBoard(boardType),
          GameCards(cards, boardType.onIconClicked),
        ]);
  }
}
