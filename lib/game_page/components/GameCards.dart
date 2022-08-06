import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';


class GameCards extends StatefulWidget {
  final cardsAmount;

  final _GameCardsState cardState = _GameCardsState();
  _GameCardsState createState() => cardState;

  changeCards(cards) => cardState._changeCards(cards);
  GameCards(this.cardsAmount) {
    GameMode.setCardChanger(changeCards);
  }

}

class _GameCardsState extends State<GameCards> {

  List<List<int>> cards = [[], []];


  @override
  void initState() {
    super.initState();
    GameMode.getCards().then((value) =>  setState(() {
      cards = value;
    }));
  }

  void _changeCards(cards)  {
    setState(() {
      this.cards = cards;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *0.65,
      width: MediaQuery.of(context).size.width *0.6,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < widget.cardsAmount; i++)
                GameCard(cards[i], widget.changeCards)
          ],
        ),
      ),
    );
  }
}
