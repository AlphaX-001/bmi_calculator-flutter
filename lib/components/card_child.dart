import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

//by extracting the cardWidget

class CardChild extends StatelessWidget {
  final String widgetText;
  final IconData cardIcon;

  CardChild({this.cardIcon, this.widgetText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(widgetText, style: kWidgetTextStyle),
      ],
    );
  }
}
