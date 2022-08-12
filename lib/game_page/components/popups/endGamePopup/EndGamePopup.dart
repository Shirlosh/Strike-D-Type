import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/application/modes/TimerMode.dart';
import 'package:strike_d_type/game_page/components/popups/endGamePopup/ScoreFlag.dart';
import '../../../../application/modes/PvPMode.dart';
import '../../../../home_page/home_page_widget.dart';
import '../../../../lobby/lobby_widget.dart';
import '../../Button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



Future<void> EndGamePopup(context, score) async {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Ink(
                //height: screenHeight*0.7,
                //width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            Image.asset('assets/images/EndGamePopup.png').image,
                        fit: BoxFit.contain)),
                child: Container(
                  child: Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    children: <Widget>[
                      ScoreFlag(score: score, winner: true),
                      Container(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.7,
                          alignment: Alignment.center,
                          child: Container(
                              alignment: Alignment.center,
                              child: Stack(
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.symmetric(vertical: screenWidth, horizontal: 500)),
                                    Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Button(
                                              image: 'assets/images/Home.png',
                                              onTap: () async {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(builder: (context) =>  HomePageWidget()),
                                                    ModalRoute.withName('/')
                                                );},

                                              margin: const EdgeInsets.fromLTRB(kIsWeb? 100:70, 0, 0, kIsWeb? 100:30),
                                              //padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                                          ),
                                          Button(
                                            image: 'assets/images/Retry.png',
                                            onTap: () async {
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LobbyWidget(GameMode.mode() == 'Timer' ? TimerMode(): PvPMode(), PlayerType == 'owner')), ModalRoute.withName('/'));

                                            },
                                            margin: const EdgeInsets.fromLTRB(0, 0, 30, kIsWeb? 100:30),
                                            padding: const EdgeInsets.fromLTRB(0, 0, kIsWeb? 130:70, 0),
                                          )
                                        ]),
                                  ]))),
                    ],
                  ),
                )));
      });
}
