import 'dart:math';

import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class UserTab extends StatelessWidget {

  final username;
  String icon;
  final icons = 16;

  UserTab(this.username)
  {
    Random random = new Random();
    int randomNumber = random.nextInt(icons) + 1;
    icon = 'assets/images/users/monster' + randomNumber.toString() + ".png";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Text.rich(
                                        TextSpan(
                                          text: "",
                                          children: [
                                            TextSpan(
                                                text: username,
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue.shade900))
                                          ],
                                          style: FlutterFlowTheme.of(context).subtitle1.override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF151B1E),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                )),
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
                                child: Container(
                                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)], child: Image.asset(icon)
                                )
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
    );
  }
}
