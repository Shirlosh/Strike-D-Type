import 'package:flutter/material.dart';
import 'Cell.dart';
class GameCard extends StatefulWidget {
  GameCard(this.cardSymbols)
  {
    rows = (cardSymbols.length / cols).ceil();
  }
  final List<int> cardSymbols;
  int rows =2;
  final cols = 4;

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
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset('assets/images/GameCard.png',).image
          ),
      ),
        child: Table(

      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: IntrinsicColumnWidth(),

      },
      children: <TableRow>[
        for(int i = 0, index = 0 ; i < widget.rows ; i++)
          TableRow(
            children: <Widget>[ for(int j = 0 ; j < widget.cols ; j++, index++) Cell(widget.cardSymbols[index])]
                // todo: rotate icons
          ),
      ],
    ));

  }
}
