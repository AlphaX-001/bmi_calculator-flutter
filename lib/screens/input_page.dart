import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_child.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/pink_bar.dart';
import '../components/my_round_button.dart';
import 'package:bmi/calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 5.6;
  int weight = 65;
  int age = 20;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                        print("Male Pressed");
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.Male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardWidget: CardChild(
                        cardIcon: FontAwesomeIcons.mars,
                        widgetText: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                        print("Female Pressed");
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.Female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardWidget: CardChild(
                        cardIcon: FontAwesomeIcons.venus,
                        widgetText: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kWidgetTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(1),
                        style: kNumberStyle,
                      ),
                      Text(
                        "feet",
                        style: kWidgetTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.white10,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                      overlayColor: Color(0x25eb1555),
                    ),
                    child: Slider(
                      value: height,
                      min: 1.0,
                      max: 10.0,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue;
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kWidgetTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              "Kg",
                              style: kWidgetTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              child: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyRoundButton(
                              child: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kWidgetTextStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              "Yr",
                              style: kWidgetTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              child: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyRoundButton(
                              child: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PinkBottomBar(
            text: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmiNumber: calc.calculateBMI(),
                      bmiResult: calc.getResult(),
                      dialoguetext: calc.getDialogue(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
