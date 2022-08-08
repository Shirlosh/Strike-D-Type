import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/popups/endGamePopup/ScoreFlag.dart';
import '../../../../home_page/home_page_widget.dart';
import '../../../../lobby/lobby_widget.dart';
import '../../Button.dart';


Future<void> EndGamePopup(context, score) async {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            //  insetPadding: EdgeInsets.all(10),
            child: Ink(
                height: screenHeight*0.7,
                width: screenWidth,
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
                      ScoreFlag(score),
                      Container(
                          width: screenWidth,
                          height: screenHeight * 0.7,
                          alignment: Alignment.center,
                          //  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Container(
                              alignment: Alignment.center,
                              child: Stack(
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    Padding(
                                        //         240.0
                                        //padding:EdgeInsets.all(1.0),),
                                        padding: EdgeInsets.fromLTRB(
                                            screenWidth * 0.2,
                                            screenHeight * 0.4,
                                            screenWidth,
                                            screenHeight * 0.9)),
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Button(
                                              image: 'assets/images/Home.png',
                                              onTap: () async { await Navigator.push(context,  MaterialPageRoute(builder: (context) =>  HomePageWidget(),),);},
                                              margin: const EdgeInsets.fromLTRB(70, 1, 1, 100),
                                              padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                                          ),
                                          Button(
                                            image: 'assets/images/Retry.png',
                                            onTap: () async {await Navigator.push(context, MaterialPageRoute(builder:(context) => LobbyWidget(GameMode, true),),);},
                                            margin: const EdgeInsets.fromLTRB(1, 1, 30, 100),
                                            padding: const EdgeInsets.fromLTRB(1, 1, 40, 0),
                                          )
                                        ]),
                                  ]))),
                    ],
                  ),
                )));
      });
}
