import 'package:flutter/services.dart';
import 'package:strike_d_type/game_page/components/endGamePopup/endGamePopup.dart';
import 'package:strike_d_type/game_page/components/game_mode_choices_popup.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';

import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 700,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1350,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0.085,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x002362AF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
                          Icons.info_outlined,
                          color: Color(0xFF5D5D5D),
                          size: 30,
                        ),
                        onPressed: () async {
                          //await actions.changeSoundState();
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Color(0x00FFFFFF),
                        borderRadius: 8,
                        borderWidth: 2,
                        buttonSize: 45,
                        icon: Icon(
                          Icons.music_note,
                          color: Color(0xFF5D5D5D),
                          size: 25,
                        ),
                        onPressed: () async {
                          //await actions.changeSoundState();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/strike-d-type2_typo.png',
                          height: 300,
                          fit: BoxFit.contain,
                        ).animated([animationsMap['imageOnPageLoadAnimation']]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 20),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Arena code'),
                                                  //todo:need to do something with this input https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
                                                  content: TextField(
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Text Field in Dialog"),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                  },
                                  text: 'Join Game',
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
                                ).animated([
                                  animationsMap['buttonOnPageLoadAnimation1']
                                ]),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 20),
                                child: FFButtonWidget(
                                  onPressed:() async { gameModeDialog(context);},
                                  text: 'Create Arena',
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
                                ).animated([
                                  animationsMap['buttonOnPageLoadAnimation2']
                                ]),
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
      ),
    );
  }
}
