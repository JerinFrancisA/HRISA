import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

/// [SubHeadingText] inherits [StatelessWidget]
///
/// This custom widget is used for all Heading used in the application. Uses a
/// standard [Text] widget.
///
/// The [text] property is a @required which is to be passed. This [text] is hence
/// the Heading which will be rendered.
///
/// The [text] uses default textStyle of [kHrisaText], which can be change in the
/// utilities/constants.dart file
///
/// The [text] uses default color of [kHeadingColor], which can be change in the
/// utilities/constants.dart file

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