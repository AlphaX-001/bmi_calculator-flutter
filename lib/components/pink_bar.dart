import 'package:flutter/material.dart';
import '../constants.dart';

class PinkBottomBar extends StatelessWidget {
  final String text;
  final Function onTap;
  PinkBottomBar({@required this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            text,
            style: kBottomBarTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: kInitialBottomBarColour,
        height: kBottomBarHeight,
        width: double.infinity,
      ),
    );
  }
}
