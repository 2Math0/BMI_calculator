import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFEEDEDED),
        accentColor: kPurple,
        textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFF515360))),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape:RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          thumbColor:kPurple.withOpacity(0.9),
          overlayColor: kPurple.withOpacity(0.15),
          activeTrackColor: kPurple.withOpacity(0.3),
        ),
      ),
      home: InputPage(),
    );
  }
}



