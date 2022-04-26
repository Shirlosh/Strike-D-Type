import 'package:flutter/material.dart';
import 'package:strike_d_type/backend/engine/game_card.dart';
import 'package:strike_d_type/constants.dart';

class PlayingCard extends StatelessWidget {
  final GameCard card;
  final double size;
  final bool visible;
  final Color color;

  const PlayingCard(
      {Key key, this.card, this.size = 1, this.visible = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GameCard(cardSymbols: [],),
    );
  }
}