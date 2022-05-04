import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../../backend/handle-req.dart';

class GameCards extends StatelessWidget {
  final size;
  List<List<int>> cards;

  GameCards(this.size){
    String GameID = "1";
    int cardsAmount = size;
    cards = getCards(GameID,cardsAmount);
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
      <GameCard>[
        for (var i = 0; i < size; i++) GameCard(cards[i])
      ],
    );
  }
}
