import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild,this.onPress});
  final Color colour;
  final Widget cardChild;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 14.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(2, 4),
          )],
        ),
      ),
    );
  }
}