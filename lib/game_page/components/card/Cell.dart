import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/card/themes/classic.dart';

class Cell extends StatefulWidget {
  IconData icon;
  Color color;
  final index;
  Cell(this.index)
  {
    icon = ClassicTheme.getIcon(index);
    color = ClassicTheme.getColor(index);
  }

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
      child: IconButton(
        icon: Icon(widget.icon),
        color: widget.color,
        onPressed: iconClicked,
      ),
    );
  }

  iconClicked() {
    print(widget.icon.toString() + " button clicked");
  }

}