import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strike_d_type/dto_objects/twoCardsDTO.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../../backend/handle_requests.dart';

class GameCards extends StatelessWidget {
  final int size;
  String gameTurn;
  final int gameID;
  List<List<int>> cards;
  int sameSymbol;

  GameCards(this.size, this.gameID) {
    Map<String, dynamic> cardsMap = jsonDecode(getTurnData(gameID.toString()));
    var gameTurn = TwoCardsDTO.fromJson(cardsMap);

    print(gameTurn);

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
