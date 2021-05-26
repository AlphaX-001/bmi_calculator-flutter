import 'package:flutter/material.dart';

//by extracting the container widget

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardWidget;
  // final Function onPress;
  ReusableCard({
    @required this.colour,
    this.cardWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardWidget,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      //child: Text("Ani"),
    );
  }
}
