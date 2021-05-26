import 'dart:math';

class CalculatorBrain {
  final double height;
  final int weight;
  CalculatorBrain({this.height, this.weight});

  double _bmi;
  String calculateBMI() {
    _bmi = (weight / (pow((height * 0.3048), 2)));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getDialogue() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight, try to exercise more.";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "You have a Normal body weight, Good Job !!";
    } else {
      return "You have a lower than normal body weight, you can eat a bit more.";
    }
  }
}
