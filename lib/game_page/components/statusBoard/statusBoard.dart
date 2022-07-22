import 'package:flutter/material.dart';

class StatusBoard extends StatelessWidget {

  StatusBoard(this.gameMode);
  final gameMode;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset('assets/images/ScoreBoard.png',).image
            ),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: gameMode
        ),
      ],
    );
  }
}
