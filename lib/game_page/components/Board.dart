import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import 'package:strike_d_type/game_page/components/statusBoard/statusBoard.dart';
import '../../backend/handle-req.dart';

class Board extends StatelessWidget {
  Board(this.gameID)
  {
    prepareGameBeforeStart(gameID);
  }

  final cards = 2;
  final gameID;

  @override
  Widget build(BuildContext context) {

    return Column(
      children:[
        StatusBoard(),
        GameCards(cards),
      ]
    );

  }
}
