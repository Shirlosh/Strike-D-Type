import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:strike_d_type/dto_objects/twoCardsDTO.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../../backend/handle_requests.dart';

class GameCards extends StatelessWidget {
  final int size;
  Map<String, dynamic> gameTurn;
  final int gameID;
  List<List<int>> cards;

  GameCards(this.size, this.gameID) {
    gameTurn = jsonDecode(getTurnData(gameID.toString()));
    cards = gameTurn["cards"] as List<List<int>>;
    int x=3;
  }

  @override
  Widget build(BuildContext context) {
    //needs to be something like that

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <GameCard>[for (var i = 0; i < size; i++) GameCard(cards[i])],
    );
  }
}
