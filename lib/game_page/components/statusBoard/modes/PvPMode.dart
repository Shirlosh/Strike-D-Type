import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../application/Globals.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_database/firebase_database.dart';


// todo: change to PvP board
class PvPMode extends StatefulWidget {
  final _PvPText modeState = _PvPText();
  _PvPText createState() => _PvPText();
  onIconClicked(bool success) => modeState._onIconClicked(success);

}

class _PvPText extends State<PvPMode> {
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
        });
        //ChangeCards(values[ChoosenCards]);
      }
    });
  }

  void _onIconClicked(bool success) {
    print('PvP _onIconClicked');
  }
    @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$_playerScore : $_opponentScore', textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
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