import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final onTap;
  final image;
  final margin;
  final padding;
  Button({this.image, this.onTap, this.margin,this.padding});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: screenWidth*0.1,
        height: screenHeight*0.15,
        margin: margin,//const EdgeInsets.fromLTRB(70, 1, 1, 100),
        padding: padding,//const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 1.5,
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
