import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Button extends StatelessWidget {

  final onTap;
  final image;
  final margin;
  final padding;
  final scale;
  Button({this.image, this.onTap, this.margin,this.padding, this.scale = kIsWeb ? 1.7 : 2.7});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: screenWidth*0.15,
        height: screenHeight*0.15,
        margin: margin,//const EdgeInsets.fromLTRB(70, 1, 1, 100),
        padding: padding,//const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: scale,//3,
              //   alignment: Alignment.center,
              image: AssetImage(image),
              fit: BoxFit.none,
            ),
          ),
        ),
      ),
    );
  }
}
