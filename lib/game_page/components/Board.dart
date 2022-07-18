import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import '../../backend/handle-req.dart';

class Board extends StatelessWidget {
  Board(this.symbolsAmount)
  {
    this.gameID = createGame(symbolsAmount);
  }
  final symbolsAmount;
  final cards = 2;
  int gameID;

  @override
  Widget build(BuildContext context) {
    return GameCards(cards);
  }
}
