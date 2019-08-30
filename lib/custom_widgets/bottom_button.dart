import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

/// [BottomButton] inherits [StatelessWidget]
///
/// This custom widget is used for all Buttons used in the application. Uses a
/// [RawMaterialButton] widget with a [Padding] widget wrapped around it.
///
/// The [text] property is a @required which is to be passed. This [text] is hence
/// the Button name which will be rendered on the button.
///
/// The [onPressed] property which is a [Function] needs to be passed.
///
/// The [text] uses default color of [kBottomButtonColor], which can be change in the
/// utilities/constants.dart file

class BottomButton extends StatelessWidget {
  final text;
  final Function onPressed;

  BottomButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RawMaterialButton(
        elevation: 8.0,
        onPressed: onPressed,
        child: Text(
          text,
          style: kHrisaText.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        fillColor: kBottomButtonColor,
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: 50.0,
        ),
      ),
    );
  }
}
