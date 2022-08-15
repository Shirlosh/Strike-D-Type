import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class ScoreFlag extends StatelessWidget {
  ScoreFlag({this.text, this.winner = true});
  final winner;
  final text;
  final greenFlag = "assets/images/GreenFlag.png";
  final redFlag = "assets/images/RedFlag.png";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
        top: screenHeight * 0.025,
        child: SizedBox(
          width: screenWidth  * 0.27,
          height: screenHeight *0.3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(
                   winner ? greenFlag : redFlag,
                  ).image,
                  fit: BoxFit.cover),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth  * 0.02 ,
                        lineHeight: 0.1,
                        color: Colors.orange.shade50,
                      )),
            ),
          ),
        ));
  }
}
