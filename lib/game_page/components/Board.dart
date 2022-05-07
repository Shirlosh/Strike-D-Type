import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:strike_d_type/dto_objects/twoCardsDTO.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import '../../backend/handle_requests.dart';

class Board extends StatelessWidget {
  int symbolsAmount;
  final cards = 2;
  int gameID;

  Board(this.symbolsAmount) {
    this.gameID = jsonDecode(getNewGame(symbolsAmount));
  }

  String getGameTurn(int gameId) {
    String data = jsonDecode(getTurnData(jsonEncode(gameID)));
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return GameCards(key: key, size: 2, gameTurn:getGameTurn(gameID));
  }
}
