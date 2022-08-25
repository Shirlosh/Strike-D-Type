import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/popups/endGamePopup/EndGamePopup.dart';
import '../../../../application/Globals.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_database/firebase_database.dart';


class PvPType extends StatefulWidget {
  final _PvPText modeState = _PvPText();
  _PvPText createState() => _PvPText();
  onIconClicked(bool success) => modeState._onIconClicked(success);

}

class _PvPText extends State<PvPType> {
  int _playerScore = 0;
  int _opponentScore = 0;


  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance.ref('games').onChildChanged.listen((event) {
      Map<String, dynamic> values = jsonDecode(event.snapshot.value);
      if(values['id'] == GameID) {
        setState(() {
          _playerScore = values['score'][PlayerType];
          _opponentScore = values['score'][OpponentType];

          if (_playerScore.abs() + _opponentScore.abs() == 21)
            {
              EndGamePopup(context, score: _playerScore, winner: _playerScore >= _opponentScore);
            }
        });
      }
    });
  }

  void _onIconClicked(bool success) { }
    @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:Text('$_playerScore : $_opponentScore', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: screenHeight  * 0.15,
          color: Colors.orange.shade50,
          lineHeight: 1,
        ),)),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text('You   :   Opponent', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          lineHeight: 0.4,
          fontSize: screenHeight * 0.03,
          color: Colors.orange.shade50,
        )),),
      ],
    );
  }

}