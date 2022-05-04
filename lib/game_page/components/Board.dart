import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/GameCards.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

class Board extends StatelessWidget {
  const Board({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameCards(2);
  }
}
