import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/card/themes/classic.dart';


class Cell extends StatefulWidget {
  IconData icon;
  Color color;
  final index;
  final boardOnSuccess;
  final changeCards;
  Cell(this.index, this.boardOnSuccess, this.changeCards)
  {
    icon = ClassicTheme.getIcon(index);
    color = ClassicTheme.getColor(index);
  }

  @override
  State<Cell> createState() => _CellState();
}


class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 32,
      child: IconButton(
        icon: Icon(widget.icon),
        color: widget.color,
        onPressed: iconClicked,
      ),
    );
  }


  iconClicked() {
    GameMode.getRequest().isCorrectSymbol(widget.index, GameID).then((value) =>
    {
    if (value) {
        //print(widget.icon.toString() + " is Correct!")
    widget.boardOnSuccess(true)
    }
    else
    {
      //print(widget.icon.toString() + " inCorrect")
    widget.boardOnSuccess(false)
    }
    });

    widget.changeCards();
  }
}