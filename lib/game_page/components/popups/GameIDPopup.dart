import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../application/Globals.dart';
import '../../../application/modes/PvPMode.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../lobby/lobby_widget.dart';
import 'package:strike_d_type/application/Globals.dart';
import '../../../../lobby/lobby_widget.dart';
import '../Button.dart';
import '../InputField.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> GameIDPopup(context) async {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  InputField inputField = InputField(
      padding: EdgeInsets.fromLTRB(kIsWeb ? 150 : 70, 0, kIsWeb ? 150 : 70, 0),
      errorText: 'invalid arena code',
      onChange: (value) {
        GameID = value;
      });

  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Ink(
                height: screenHeight * 0.4,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            Image.asset('assets/images/GameIDPopup.png').image,
                        fit: BoxFit.fill)),
                child: Container(
                  child: Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.9,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                                  child: Text("Arena Code",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: screenHeight * 0.03,
                                            color: Colors.black45,
                                          ))),
                              inputField,
                              Button(
                                  scale: kIsWeb ? 1.7 : 2.7,
                                  image: 'assets/images/OK.png',
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 50),
                                  onTap: () => {
                                        _onConfirm(context).then((value) =>
                                            inputField.setValidate(value))
                                      })
                            ]),
                      ),
                    ],
                  ),
                )));
      });
}

Future<bool> _IDValidation() async {
  var snapshot = await FirebaseDatabase.instance.ref('games').child(GameID).get();
  if (snapshot.exists)
  {
    Map<String, dynamic> values = jsonDecode(snapshot.value);
    if (values['started'] == false && values['full'] == false) return true;
  }
  return false;
}

Future<bool> _onConfirm(context) async {
  bool validate = await _IDValidation();
  if (validate) {
    Navigator.pop(context, true);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LobbyWidget(PvPMode(), false)));
    return true;
  } else
    return false;
}
