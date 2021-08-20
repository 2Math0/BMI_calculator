import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.gender,@required this.iconSex});
  final String gender;
  final IconData iconSex;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconSex,
          size: 100.0,
          color: Colors.white,
        ),
        SizedBox(height: 15.0,),
        Text(gender,style:kGenderTextStyle,)
      ],
    );
  }
}