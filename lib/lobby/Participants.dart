import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/card/GameCard.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class Participates extends StatefulWidget {
  final _ParticipatesState participatesState = _ParticipatesState();

  _ParticipatesState createState() => participatesState;

  changeParticipates(participatesList) =>
      participatesState._changeParticipates(participatesList);

  Participates() {
    GameMode.listenOnParticipates(changeParticipates);
  }
}

class _ParticipatesState extends State<Participates> {
  List<String> participatesList = [Username,""];

  @override
  void initState() {
    super.initState();
    //GameMode.getParticipatesList().then((value) => setState(() {participatesList = value;}));
  }

  void _changeParticipates(participatesList) {
    setState(() {
      this.participatesList = participatesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
          text: "Good Luck ",
          children: [
            TextSpan(
                text: participatesList[0] + " and " + participatesList[1] + "!",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900))
          ],
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF151B1E),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
