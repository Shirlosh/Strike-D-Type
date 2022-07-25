import 'package:flutter/material.dart';
import 'Cell.dart';
import 'dart:math';

class GameCard extends StatefulWidget {
  GameCard(this.cardSymbols, this.boardOnSuccess, this.changeCards) {
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
    double widthC = MediaQuery.of(context).size.width * 0.30;
    double heightC = MediaQuery.of(context).size.height;
    return Container(
        width: widthC,
        height: heightC ,
       // margin: EdgeInsets.all(10),
        //20
    //color: Colors.blue,
       // padding: EdgeInsets.all(25),
        clipBehavior: Clip.hardEdge,
       decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/GameCard.png',
              ).image),
        ),
        alignment: Alignment.center,
        child:Container(
            width: widthC * 0.60,
            height: heightC*0.56,
           margin: const EdgeInsets.only(left:1.0, right: 2.0),
           //padding:    const EdgeInsets.only(left:1.0, right: 2.0),
            alignment: Alignment.center,
           // color: Colors.blue,
            child:Expanded(child:GridView.count(
            childAspectRatio: 1.2,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            crossAxisCount: 2,

            children: <Transform>[
              for (int i = 0, index = 0; i < widget.rows; i++)
                for (int j = 0; j < widget.cols; j++, index++)
                  Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationZ(widget.random.nextInt(1000) / 100),
                      child: Transform.scale(
                        scale: widget.random.nextDouble()+widget.random.nextInt(3)+0.45,
                        child: ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: Cell(widget.cardSymbols[index],
                                widget.boardOnSuccess, widget.changeCards)),
                      ))
            ]))));
  }
}
