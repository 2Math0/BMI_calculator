import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.weight,this.height});
  int weight;
  int height;
  double _bmi;

  String calculateBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(2);
  }
  String getResult(){
    if(_bmi>= 25){
      return 'Overweight';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else {return 'Underweight';}
  }
  String getInterpretation(){
    if(_bmi>= 25){
      return 'You are higher than Normal body weight\n Let\'s do some exercise';
    }else if (_bmi > 18.5){
      return 'Good Work, You have A normal Body WEIGHT'.toUpperCase();
    }else {return 'Why you hate food, eat more and be lazy';}
  }
}