import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import '../components/pink_bar.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String dialoguetext;
  final String bmiNumber;
  ResultPage(
      {@required this.bmiResult,
      @required this.dialoguetext,
      @required this.bmiNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result...",
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        bmiResult.toUpperCase(),
                        style: kResultText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmiNumber,
                      style: kBmiResultStyle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Image(
                        image: AssetImage("images/BMI.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                      child: Text(
                        dialoguetext,
                        style: kDialogue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PinkBottomBar(
              text: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
