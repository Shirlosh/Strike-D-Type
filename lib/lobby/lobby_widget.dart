import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:strike_d_type/application/Globals.dart';
import '../application/modes/Mode.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../game_page/game_page_widget.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';

class LobbyWidget extends StatefulWidget {
  LobbyWidget(Mode mode,this.owner, {this.replay = false})
  {
    GameMode = mode;
  }
  final replay;
  final owner;
  @override
  _LobbyWidgetState createState() => _LobbyWidgetState();
}

class _LobbyWidgetState extends State<LobbyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String gameID = '';

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: gameID));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    PlayerType = widget.owner ? 'owner' : 'joins';
    OpponentType = widget.owner ? 'joins' : 'owner';
    if (widget.replay == false) { //check for local
      GameMode.createGame(6).then((value) =>
          setState(() {
            GameID = value;
            this.gameID = value;
          }));
    }
    else
      {
        setState(() {
          this.gameID = GameID;
        });
      }
    WidgetsBinding.instance.addPostFrameCallback((_) => {
    if (GameMode.mode() == 'Timer')
    {
        Navigator.pop(context, true),
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GamePageWidget(),
        ))
    }});
    bool once = true;
    if(PlayerType == 'joins')
    {
      FirebaseDatabase.instance.ref('games').onChildChanged.listen((event) {
        Map<String, dynamic> data = jsonDecode(event.snapshot.value);
        if(data['id'] == GameID  && (data['started'] == true) && once)
          {
            once = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePageWidget(),
            ));
          }
      });
      FirebaseDatabase.instance.ref('games').onChildRemoved.listen((event) {
        Map<String, dynamic> data = jsonDecode(event.snapshot.value);
        if(data['id'] == GameID)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>  HomePageWidget()),
              ModalRoute.withName('/')
          );
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    if (GameMode.mode() == 'Timer') return Container();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFDC00),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB877FF), Color(0xFFFBAB66)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.64, 1),
            end: AlignmentDirectional(-0.64, -1),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Color(0x00FFFFFF),
                      borderRadius: 8,
                      borderWidth: 2,
                      buttonSize: 45,
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Color(0xFF5D5D5D),
                        size: 30,
                      ),
                      onPressed: () async {
                        GameMode.leaveGame();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'GAME ID: $gameID',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Roboto',
                            fontSize: 30,
                          ),
                    ),
                    Container(
                      child: IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: _copyToClipboard,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Waiting:',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                        color: Color(0x84FFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Flexible(
                                          //todo:need to do something with this input https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Text.rich(
                                                TextSpan(
                                                  text: "Good Luck ",
                                                  children: [
                                                    TextSpan(
                                                        text: Username +"!",
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .blue.shade900))
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF151B1E),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ))),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFDBE2E7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Strike-D-TYPE.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  GameMode.startGame().then((value) async => {
                                  if(value == true){
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GamePageWidget(),
                                    ),
                                  )}});
                                },
                                text: 'Start!',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 50,
                                  color: Color(0x00FFD100),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Roboto',
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Color(0x7CFFFFFF),
                                    width: 4,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
