import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../endGamePopup.dart';

class TimerMode extends StatefulWidget {
  @override
  final _TimerMode modeState = _TimerMode();
  _TimerMode createState() => modeState;

  onIconClicked(bool success) => modeState._onIconClicked(success);
  format(Duration d) => d.toString().substring(3, 7);

}

class _TimerMode extends State<TimerMode> {

  int _score = 0;
  int _counter = 10;

  initState() { _startTimer();  }

  void _onIconClicked(bool success)  {
    setState(() {
      if(success) _score++;
      else _score--;
    });  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter--;
        if (_counter == 0) {
          timer.cancel();
          tryShowDialog(context,_score);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$_score", textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 35, //MediaQuery.of(context).size.height * 0.17,
          color: Colors.orange.shade50,//,lineHeight: 1.1
        )),
        Text(widget.format(Duration(seconds: _counter)), textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 25, //MediaQuery.of(context).size.height * 0.05
          color: Colors.orange.shade50,
        )),
      ],

    );
  }
}