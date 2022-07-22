import 'package:flutter/material.dart';
import 'Cell.dart';
import 'dart:math';

class GameCard extends StatefulWidget {

  GameCard(this.cardSymbols, this.boardOnSuccess, this.changeCards)
  {
    rows = (cardSymbols.length / cols).ceil();
  }
  final List<int> cardSymbols;
  int rows;
  final cols = 3;
  final boardOnSuccess;
  final changeCards;
  Random random = new Random();
  List<int> randomNumbers = [];

  @override
  State<GameCard> createState() => _GameCardState();
}
// todo: fit table to picture
class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350, //500
        height: 350, //500
        margin: EdgeInsets.all(10), //20
        padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset('assets/images/GameCard.png',).image
          ),
      ),
      alignment: Alignment.center,
      child: GridView.count(
        childAspectRatio: 1.2,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: <Transform>[
          for (int i = 0, index = 0; i < widget.rows; i++)
            for (int j = 0; j < widget.cols; j++, index++)
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(widget.random.nextInt(1000) / 100),
                  child: Transform.scale(
                      scale: widget.random.nextInt(3).toDouble() + 1,
                      child: Cell(widget.cardSymbols[index],widget.boardOnSuccess, widget.changeCards),))
        ]));
  }
}
