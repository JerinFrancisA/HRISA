import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class HeadingText extends StatelessWidget {
  final text;
  final style;
  HeadingText({@required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: style??kHrisaText.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
          letterSpacing: 3.0,
          color: kHeadingColor,
        ),
      ),
    );
  }
}