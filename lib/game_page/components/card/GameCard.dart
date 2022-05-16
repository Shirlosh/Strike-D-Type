import 'package:flutter/material.dart';
import 'Cell.dart';
//todo delete
class GameCard extends StatefulWidget {
  GameCard(this.cardSymbols)
  {
    rows = cardSymbols.length ~/ cols;
  }
  final List<int> cardSymbols;
  int rows;
  final cols = 3;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color:Colors.white),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        for(int i = 0, index = 0 ; i < widget.rows ; i++)
          TableRow(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            children: <Widget>[
             for(int j = 0 ; j < widget.cols ; j++, index++)
                Cell(widget.cardSymbols[index])
          ],
        ),

      ],
    );
  }
}
