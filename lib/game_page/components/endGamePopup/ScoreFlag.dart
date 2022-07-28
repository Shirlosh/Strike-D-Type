import 'package:flutter/material.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class ScoreFlag extends StatelessWidget {
  ScoreFlag(this.score);

  final score;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        child:SizedBox(
            width: 400,
            height: 300,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(
                        "assets/images/GreenFlag.png",
                      ).image,
                      fit: BoxFit.cover),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text('your score is $score',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            lineHeight: 0.1,
                            color: Colors.black38,
                          )),
                ),
              ),
            ));
  }
}
