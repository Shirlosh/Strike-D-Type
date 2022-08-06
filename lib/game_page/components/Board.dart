import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import 'package:strike_d_type/game_page/components/statusBoard/StatusBoard.dart';

class Board extends StatelessWidget {

  final cards = 2;


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatusBoard(GameMode.getStatusBoardContent()),
          GameCards(cards),
        ]);
  }
}
