import 'dart:convert';
import 'package:flutter/material.dart';

import '../../backend/handle_requests.dart';
import 'GameCards.dart';


class Board extends StatelessWidget {
  int symbolsAmount;
  final cards = 2;
  int gameID;

  Board(this.symbolsAmount) {
    String id = getNewGame(symbolsAmount);
    this.gameID =jsonDecode(id);
    int x = 1;
  }

  @override
  Widget build(BuildContext context) {
    return GameCards(2, gameID);
  }
}
