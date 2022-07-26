import 'package:flutter/material.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class ScoreFlag extends StatelessWidget {
  ScoreFlag(this.score);

  final score;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(

      image: DecorationImage(image: Image.asset("assets/images/GreenFlag.png",).image, fit:BoxFit.cover ),
    ),
      child:Text('your score is $score',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: Colors.black26,
          )),);

  }
}