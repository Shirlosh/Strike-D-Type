import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import '../../backend/handle_requests.dart';

class Board extends StatelessWidget {
  Board()
  {
    this.gameID = jsonDecode(getGameID());
  }
  final cards = 2;
  int gameID;

  @override
  Widget build(BuildContext context) {
    return GameCards(cards);
  }
}
