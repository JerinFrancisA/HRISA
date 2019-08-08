import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

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
