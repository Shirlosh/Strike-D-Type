import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../home_page/home_page_widget.dart';
import '../../../../lobby/lobby_widget.dart';
import '../../../application/modes/PvPMode.dart';
import '../../../application/modes/TimerMode.dart';

Future<void> gameModePopup(context) async {
  showDialog<bool>(
    context: context,
    /* builder: (alertDialogContext) {
      return _GameModePopup();
    },*/
  );
}

Future<void> gameModeDialog(context) async {
  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(1),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB877FF), Color(0xFFFBAB66)],
                stops: [0, 1],
                begin: AlignmentDirectional(0.64, 1),
                end: AlignmentDirectional(-0.64, -1),
              ),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ///Single Player
                  RaisedButton(
                    color: Color(0x00FFD100),
                    colorBrightness:
                        ThemeData.estimateBrightnessForColor(Color(0x00FFD100)),
                    // disabledColor: widget.options.disabledColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Color(0x7CFFFFFF),
                        width: 4,
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LobbyWidget(TimerMode(), true),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 112,
                      height: 100,
                      child: Ink(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/SinglePlayer.png'),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///Two Players
                  RaisedButton(
                    color: Color(0x00FFD100),
                    colorBrightness:
                        ThemeData.estimateBrightnessForColor(Color(0x00FFD100)),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Color(0x7CFFFFFF),
                        width: 4,
                      ),
                    ),
                    // splashColor: widget.options.splashColor,
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LobbyWidget(PvPMode(), true)));
                    },
                    child: SizedBox(
                      width: 112,
                      height: 100,
                      child: Ink(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/TwoPlayers.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        );
      });
}
