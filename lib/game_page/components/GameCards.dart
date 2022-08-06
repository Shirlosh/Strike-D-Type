import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';


class GameCards extends StatefulWidget {
  final cardsAmount;

  final _GameCardsState cardState = _GameCardsState();
  _GameCardsState createState() => cardState;

  changeCards() => cardState._changeCards();
  GameCards(this.cardsAmount);

}

class _GameCardsState extends State<GameCards> {

  List<List<int>> cards = [[], []];


  @override
  void initState() {
    super.initState();
    GameMode.getRequest().getCards(GameID).then((value) =>  setState(() {
      cards = value;
    }));
  }

  void _changeCards()  {
    GameMode.getRequest().getCards(GameID).then((value) =>  setState(() {
      cards = value;
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < widget.cardsAmount; i++)
            GameCard(cards[i], widget.changeCards)
      ],
    );
  }
}
