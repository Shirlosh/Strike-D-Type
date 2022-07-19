import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import '../../../flutter_flow/flutter_flow_theme.dart';

class TimerText extends StatefulWidget {
  @override
  _TimerText createState() => _TimerText();
}

class _TimerText extends State<TimerText> {

  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
      new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$_start", textAlign: TextAlign.center,style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 80,
          color: Colors.orange.shade50,
        )),],
    );
  }

  @override
  void initState() => onLoad(context);

  void onLoad(BuildContext context){
    startTimer();
  }

}