import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Cell.dart';
import 'dart:math';

class GameCard extends StatefulWidget {
  GameCard(this.cardSymbols) {
    rows = (cardSymbols.length / cols).ceil();
  }

  final List<int> cardSymbols;
  var rows;
  final cols = 3;
  Random random = new Random();
  List<int> randomNumbers = [];

  @override
  State<GameCard> createState() => _GameCardState();
}


class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 0.30;
    double heightC = MediaQuery.of(context).size.height ;
    return Container(
        width: widthC,
        height: heightC,
      //  clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/GameCard.png',
              ).image),
        ),
        alignment: Alignment.center,
        child: Container(
            width: widthC * 0.70,
            height: heightC * 0.60,
            margin: const EdgeInsets.only(left: 1.0, right: 2.0),
            alignment: Alignment.center,
            child: Center(
                child: GridView.count(
                    childAspectRatio: 1.2,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(1),
                    crossAxisCount: 2,
                    children: <Transform>[
                  for (int i = 0, index = 0; i < widget.rows; i++)
                    for (int j = 0; j < widget.cols; j++, index++)
                      Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(
                              widget.random.nextInt(1000) / 100),
                          child: Transform.scale(
                            scale: widget.random.nextDouble() + widget.random.nextInt(kIsWeb? 3 : 2) + (kIsWeb ? 0.8 : 0.5),
                            child: ClipRect(
                                clipBehavior: Clip.antiAlias,
                                child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minWidth: 10,
                                      minHeight: 10,
                                      maxWidth: 100,
                                      maxHeight: 100,
                                    ),
                                    child: Container(
                                        //width: 10,
                                        //height: 10,
                                        child: Cell(widget.cardSymbols[index])
                                    ))),
                          ))
                ]))));
  }
}
