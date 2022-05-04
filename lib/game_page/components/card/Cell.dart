import 'package:flutter/material.dart';

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