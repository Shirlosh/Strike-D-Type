import 'package:flutter/material.dart';
import 'package:strike_d_type/dto_objects/twoCardsDTO.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../../backend/handle_requests.dart';

class GameCards extends StatelessWidget {
  final int size;
  final String gameTurn;

  const GameCards({Key key, this.size = 2, this.gameTurn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //needs to be something like that
     List<List<int>> cards = gameTurn["_cards"] as List<List<int>>;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <GameCard>[for (var i = 0; i < size; i++) GameCard(cards[i])],
    );
  }
}
