import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

class GameCards extends StatelessWidget {
  final size;
  const GameCards(this.size);

  @override
  Widget build(BuildContext context) {
    //final card = GameCard();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
      <GameCard>[
        for (var i = 0; i < size; i++) GameCard(cardSymbols: [])
      ],
    );
  }
}
