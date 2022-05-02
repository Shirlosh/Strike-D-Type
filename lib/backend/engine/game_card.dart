import 'package:flutter/material.dart';
import 'package:strike_d_type/backend/engine/Game.dart';

class GameCard extends StatefulWidget {
  GameCard({Key key, this.cardSymbols}) : super(key: key);
  final List<int> cardSymbols;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
             Cell(Icons.icecream_sharp,Colors.yellow),Cell(Icons.shuffle,Colors.black),Cell(Icons.score,Colors.indigo)
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Cell(Icons.accessibility_new_sharp,Colors.green),Cell(Icons.ac_unit_sharp,Colors.deepOrange),Cell(Icons.access_alarm,Colors.brown)

          ],
        ),
      ],
    );
  }
}


class Cell extends StatefulWidget {
  final icon;
  final color;
  const Cell(this.icon,this.color);

  @override
  State<Cell> createState() => _CellState();
}


class _CellState extends State<Cell>
{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 64,
      width: 32,
      color: Colors.white,
      child: Icon(
        widget.icon,
        color: widget.color,
        size: 24.0,
      ),
    );
  }

}