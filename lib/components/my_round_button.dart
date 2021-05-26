import 'package:flutter/material.dart';

class MyRoundButton extends StatelessWidget {
  final IconData child;
  final Function press;
  MyRoundButton({this.child, this.press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: press,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 20.0,
      fillColor: Color(0x404c4f5e),
    );
  }
}
