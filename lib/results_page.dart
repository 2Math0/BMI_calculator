import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.resultText,@required this.bmiResult,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kTitleStyle),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: TextStyle(color: Color(0xFF24DD76),fontSize: 22.0,fontWeight: FontWeight.bold)),
                  Text(bmiResult,style: TextStyle(color: kTextColor,fontSize: 100,fontWeight: FontWeight.w800,decorationStyle:TextDecorationStyle.wavy ),),
                  Text(interpretation, style: TextStyle(fontSize: 18.0,color: kTextColor),softWrap: true,textAlign: TextAlign.center,)
                ],
              ),
            ),
            flex: 5,
          ),
          BottomRoute(iconData: Icons.refresh, press:  () {
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
