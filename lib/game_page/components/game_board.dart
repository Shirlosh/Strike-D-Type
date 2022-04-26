import 'package:flutter/material.dart';
import 'package:strike_d_type/backend/engine/game_card.dart';
import 'package:strike_d_type/game_page/components/playing_card.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = GameCard();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <PlayingCard>[
        PlayingCard(
          card: null,
          visible: true,
          color: Colors.red,
        ),
        PlayingCard(
          card: null,
          visible: true,
          color: Colors.green,
        ),
      ],
    );
  }
}
