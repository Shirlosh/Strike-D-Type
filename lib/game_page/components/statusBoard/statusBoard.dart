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
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset('assets/images/ScoreBoard.png',).image
            ),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Expanded(
            flex: 3,
              child:ClipRect(
              clipBehavior: Clip.hardEdge,
              child:gameMode))
        ),
      ],
    );
  }
}
