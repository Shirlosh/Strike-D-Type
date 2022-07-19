import 'package:flutter/material.dart';
import 'Cell.dart';
import 'dart:math';

class GameCard extends StatefulWidget {
  GameCard(this.cardSymbols) {
    rows = (cardSymbols.length / cols).ceil();
  }

  final List<int> cardSymbols;

  int rows;
  final cols = 3;
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
        width: 350,
        height: 350,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: Image
                  .asset(
                'assets/images/GameCard.png',
              )
                  .image),
        ),
        child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: IntrinsicColumnWidth(),
              2: IntrinsicColumnWidth(),
            },
            children: <TableRow>[
        for (int i = 0, index = 0; i < widget.cols; i++)
        TableRow(children: <Widget>[
    for (int j = 0; j < widget.rows; j++, index++)
    Transform(
        transform: Matrix4.rotationZ(widget.random.nextInt(1000)/100),
            child: Transform.scale(scale:widget.random.nextInt(2).toDouble()+1,
                child: Cell(widget.cardSymbols[index]))),


        ]
    )],
    ),);

  }
}
