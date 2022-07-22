import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';
import '../../backend/handle-req.dart';

class GameCards extends StatefulWidget {
  final cardsAmount;
  final boardOnSuccess;
  final gameID;

  @override
  final _GameCardsState cardState = _GameCardsState();
  _GameCardsState createState() => cardState;

  changeCards() => cardState._changeCards();

  GameCards(this.cardsAmount, this.boardOnSuccess, this.gameID);

}

class _GameCardsState extends State<GameCards> {

  List<List<int>> cards;
  @override
  void initState() {
    super.initState();
    cards = getCards(widget.gameID, widget.cardsAmount);
  }

  void _changeCards()  {
    setState(() {cards = getCards(widget.gameID, widget.cardsAmount);});  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <GameCard>[
        for (var i = 0; i < widget.cardsAmount; i++)
          GameCard(cards[i], widget.boardOnSuccess, widget.changeCards)
      ],
    );
  }
}
