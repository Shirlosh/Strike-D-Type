import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';

class PvPText extends StatelessWidget {
  int player1Score = 0;
  int player2Score = 0;

  PvPText();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('0 : 0', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 80,
          color: Colors.orange.shade50,
        ),),
        Text('You   :   Opponent', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.orange.shade50,
        ),),
      ],
    );
  }
}
