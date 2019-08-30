import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

/// [HeadingText] inherits [StatelessWidget]
///
/// This custom widget is used for all Headings used in the application. Uses a
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
        textAlign: TextAlign.center,
      ),
    );
  }
}