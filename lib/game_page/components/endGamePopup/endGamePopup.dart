import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/endGamePopup/ScoreFlag.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../home_page/home_page_widget.dart';
import '../../../lobby/lobby_widget.dart';

Future<void> endGameDialog(context, score) async {
  showDialog<bool>(
    context: context,
    builder: (alertDialogContext) {
      return _EndGamePopup(score);
    },
  );
}

Future<void> tryShowDialog(context, score) async {
  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 1,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: Image.asset("assets/images/GreenFlag.png",
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.65)),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.3,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.7,
                    alignment: Alignment.center,
                   /* decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image
                              .asset(
                            'assets/images/EndGamePopup.png',
                          )
                              .image,
                          fit: BoxFit.fill),
                    ),*/
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ScoreFlag(score),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePageWidget(),
                                      ),
                                    );
                                  }, // Handle your callback.
                                  splashColor: Colors.brown.withOpacity(0.5),
                                  child: Ink(

                                    height: 300,
                                    width: 200,
                                    decoration:   BoxDecoration(

                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/OK.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LobbyWidget(),
                                      ),
                                    );
                                  }, // Handle your callback.
                                  splashColor: Colors.brown.withOpacity(0.5),
                                  child: Ink(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Retry.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )


                              ])
                        ])),
              ],
            ));
      });
}

class _EndGamePopup extends StatelessWidget {
  _EndGamePopup(this.score);

  final score;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image
                  .asset(
                'assets/images/EndGamePopup.png',
              )
                  .image),
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
                  child:
                  Image.asset('assets/images/Retry.png'),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LobbyWidget(),
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
