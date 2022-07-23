import 'package:flutter/material.dart';
import '../../home_page/home_page_widget.dart';
import '../../lobby/lobby_widget.dart';

Future<void> endGameDialog(context, score) async {
  showDialog<bool>(
    context: context,
    builder: (alertDialogContext) {
      return _EndGamePopup(score);
    },
  );
}


Future<void> tryShowDialog(context, score) async
{

  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Stack(
              clipBehavior: Clip.none, alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset('assets/images/EndGamePopup.png',).image, fit:BoxFit.fill ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                  child: Text('your score is $score',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center
                  ),
                ),
                Positioned(
                    top: 100,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Image.asset("assets/images/GreenFlag.png", width: MediaQuery.of(context).size.width * 0.4, height: MediaQuery.of(context).size.height * 0.65)
                )
              ],
            )
        );
      }
  );

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
          mainAxisAlignment: MainAxisAlignment.center,
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
                RaisedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(),
                        ),
                      );
                    },
                    child: Text('Home')),
                RaisedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LobbyWidget(),
                        ),
                      );
                    },
                    child: Text('Retry'))
              ],
            ),
          ],
        ));
  }
}