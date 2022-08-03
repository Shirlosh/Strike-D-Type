import 'package:flutter/material.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';


class PvPMode extends StatefulWidget {
  final _PvPText modeState = _PvPText();
  _PvPText createState() => _PvPText();
  onIconClicked(bool success) => modeState._onIconClicked(success);

}

class _PvPText extends State<PvPMode> {
  int player1Score = 1;
  int player2Score = 2;

  void _onIconClicked(bool success) {
    print('OK');
  }
    @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$player1Score : $player2Score', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
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