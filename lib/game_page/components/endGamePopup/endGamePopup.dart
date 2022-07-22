import 'package:flutter/material.dart';
import 'package:strike_d_type/home_page/home_page_widget.dart';

class EndGamePopup extends StatelessWidget {
  EndGamePopup(this.score){ print("popup created"); }

  final score;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () async {
      var confirmDialogResponse =
          await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Arena code'),
                content: Text(
                    'please enter arena code'),
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
    },);
    // return Row(
    //   mainAxisSize: MainAxisSize.max,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //         width: 300,
    //         height: 200,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //               fit: BoxFit.fill,
    //               image: Image.asset(
    //                 'assets/images/EndGamePopup.png',
    //               ).image),
    //         ),
    //         alignment: AlignmentDirectional(0, 0),
    //         child: RaisedButton(
    //             onPressed: () async {
    //               await Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => HomePageWidget(),
    //                 ),
    //               );
    //             },
    //             child: Text('$score')),
    //     )
    //   ],
    // );
  }
}
