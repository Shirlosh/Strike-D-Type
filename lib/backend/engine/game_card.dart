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
            Container(
              height: 64,
              width: 32,
              color: Colors.grey,
              child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                )
              ),
              Container(
                height: 64,
                width: 32,
                color: Colors.yellow,
                child: Icon(
                  Icons.icecream_sharp,
                  color: Colors.blue,
                  size: 24.0,
                ),
              ),
            Container(
              height: 64,
              width: 32,
              color: Colors.black,
              child: Icon(
                Icons.shuffle,
                color: Colors.pinkAccent,
                size: 24.0,
              ),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 32,
              color: Colors.deepOrange,
              child: Icon(
                Icons.accessibility_new_sharp,
                color: Colors.green,
                size: 24.0,
              ),
            ),
            Container(
              height: 64,
              width: 32,
              color: Colors.blue,
              child: Icon(
                Icons.score,
                color: Colors.redAccent,
                size: 24.0,
              ),
            ),
            Container(
                height: 64,
                width: 32,
                color: Colors.amber,
                child: Icon(
                  Icons.ac_unit_sharp,
                  color: Colors.black12,
                  size: 24.0,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
