import 'dart:math';

class Logic {
  final int height;
  final int weight;
  Logic({this.height, this.weight});

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi+1);
    return _bmi.toStringAsFixed(1);
  }
String comments() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight : Try to exercise more regularly.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight : You can eat more healthy food.';
    }
  }
String weightstatus() {

    if (_bmi >= 25) {
      print(_bmi);
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      print(_bmi);
      return 'NORMAL';
    } else {
      print(_bmi);
      return 'UNDERWEIGHT';
    }
  }


}