import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class SubHeadingText extends StatelessWidget {
  final text;
  final style;
  SubHeadingText({@required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: style??kHrisaText.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
          color: kHeadingColor,
        ),
      ),
    );
  }
}