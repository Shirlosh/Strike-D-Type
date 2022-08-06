import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strike_d_type/application/Globals.dart';
import 'package:strike_d_type/game_page/components/endGamePopup/ScoreFlag.dart';
import '../../../home_page/home_page_widget.dart';
import '../../../lobby/lobby_widget.dart';

Future<void> endGameDialog(context, score) async {
  showDialog<bool>(
    context: context,
    builder: (alertDialogContext) {
      //return _EndGamePopup(score);
    },
  );
}

Future<void> tryShowDialog(context, score) async {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            //  insetPadding: EdgeInsets.all(10),
            child: Ink(
                height: screenHeight,
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
                          height: screenHeight * 0.79,
                          alignment: Alignment.center,
                          //  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                        //         240.0
                                        //padding:EdgeInsets.all(1.0),),
                                        padding: EdgeInsets.fromLTRB(
                                            screenWidth * 0.2,
                                            screenHeight * 0.4,
                                            screenWidth,
                                            screenHeight * 0.6)),
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageWidget(),
                                                ),
                                              );
                                            },
                                            splashColor: Colors.deepOrange
                                                .withOpacity(0.5),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              margin: const EdgeInsets.fromLTRB(
                                                  70, 1, 1, 20),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      1, 1, 1, 1),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    //  scale: 1,//0.8,
                                                    //   alignment: Alignment.center,
                                                    image: AssetImage(
                                                        'assets/images/OK.png'),
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LobbyWidget(GameMode),
                                                ),
                                              );
                                            },
                                            splashColor: Colors.deepOrange
                                                .withOpacity(0.5),
                                            child: Positioned(
                                              height: screenHeight * 1,
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                margin: const EdgeInsets.fromLTRB(
                                                    1, 1, 30, 0),
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    1, 1, 40, 0),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Retry.png'),
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ]))),
                    ],
                  ),
                )));
      });
}

class _EndGamePopup extends StatelessWidget {
  _EndGamePopup(this.score);

  final score;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.3,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/EndGamePopup.png',
              ).image),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('your score is $score')],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Image.asset('assets/images/OK.png'),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageWidget(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: Image.asset('assets/images/Retry.png'),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LobbyWidget(GameMode),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ));
  }
}
