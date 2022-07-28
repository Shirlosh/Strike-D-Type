import 'package:flutter/material.dart';
import 'package:strike_d_type/game_page/components/endGamePopup/ScoreFlag.dart';
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
          // insetPadding: EdgeInsets.all(10),
            child: Ink(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            Image.asset('assets/images/EndGamePopup.png').image,
                        fit: BoxFit.contain)),
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget>[
                      ScoreFlag(score),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                         padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Stack>[
                                    Stack(
                                        clipBehavior: Clip.hardEdge,
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.all(240.0)),
                                          Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 300,
                                                  child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePageWidget(),
                                                          ),
                                                        );
                                                      },
                                                      // Handle your callback.
                                                      splashColor: Colors.brown
                                                          .withOpacity(0.5),
                                                      child: Ink(
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/OK.png'),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  height: 250,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LobbyWidget(),
                                                        ),
                                                      );
                                                    }, // Handle your callback.
                                                    splashColor: Colors.brown
                                                        .withOpacity(0.5),
                                                    child: Ink(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Retry.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ])
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
