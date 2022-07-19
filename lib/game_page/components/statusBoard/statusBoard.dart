import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/statusBoard/PvPText.dart';
import 'package:strike_d_type/game_page/components/statusBoard/TimerText.dart';

class StatusBoard extends StatelessWidget {

  StatusBoard();

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
          child: PvPText()
        ),
      ],
    );
  }
}
