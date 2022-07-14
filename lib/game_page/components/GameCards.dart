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
    final List<String> strs = gameTurn.cards.map((e) => e.toString()).toList();
    cards = List.generate(0, (it) => []);


    var listInt = List<int>.from(json.decode(strs.first).map((x) => x));
    var listInt2 = List<int>.from(json.decode(strs.last).map((x) => x));

    cards.add(listInt);
    cards.add(listInt2);



  }

  @override
  Widget build(BuildContext context) {
    //needs to be something like that

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <GameCard>[for (var i = 0; i < size; i++) GameCard(cards[i])],
    );
  }
}
