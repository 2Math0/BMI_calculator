import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;
  Gender selectedGender;
  int weight = 60;
  int age = 18;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                buttonDo: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                buttonOnLong: () {
                                  setState(
                                    () {
                                      weight -= 10;
                                    },
                                  );
                                }),
                            RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                buttonDo: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                buttonOnLong: () {
                                  setState(
                                    () {
                                      weight += 10;
                                    },
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'age'.toUpperCase(),
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundedIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              buttonDo: () {
                                setState(() {
                                  age--;
                                });
                              },
                              buttonOnLong: () {
                                setState(
                                  () {
                                    age -= 10;
                                  },
                                );
                              }),
                          RoundedIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              buttonDo: () {
                                setState(() {
                                  age++;
                                });
                              },
                              buttonOnLong: () {
                                setState(
                                  () {
                                    age += 10;
                                  },
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            thumbColor: kPurple.withOpacity(0.9),
                            overlayColor: kPurple.withOpacity(0.15),
                            activeTrackColor: kPurple.withOpacity(0.3),
                            inactiveTrackColor: kPurple.withAlpha(12),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 100,
                              max: 330,
                              onChanged: (double selectedHeight) {
                                setState(() {
                                  height = selectedHeight.round();
                                });
                              }),
                        )
                      ]))),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardPeople
                      : kInactiveColor,
                  cardChild: IconContent(
                    gender: 'FEMALE',
                    iconSex: FontAwesomeIcons.female,
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardPeople
                      : kInactiveColor,
                  cardChild: IconContent(
                    iconSex: FontAwesomeIcons.male,
                    gender: "MALE",
                  ),
                )),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'All copyright to 2Math',
                style: TextStyle(color: Color(0xaa515360)),
              ),
            ),
          ),
          BottomRoute(
            iconData: CupertinoIcons.heart_solid,
            press: () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomRoute extends StatelessWidget {
  const BottomRoute({@required this.iconData, @required this.press});
  final IconData iconData;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 80.0),
      height: 68,
      width: 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: press,
          child: Icon(iconData),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {@required this.buttonIcon, @required this.buttonDo, this.buttonOnLong});
  final IconData buttonIcon;
  final Function buttonDo;
  final Function buttonOnLong;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: buttonDo,
      fillColor: kActiveColor,
      hoverElevation: 20.0,
      highlightElevation: 30,
      onLongPress: buttonOnLong,
      highlightColor: kActiveCardPeople,
      splashColor: kActiveCardPeople,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      child: Icon(
        buttonIcon,
        color: kTextColor.withOpacity(0.8).withRed(120).withBlue(210),
      ),
    );
  }
}
