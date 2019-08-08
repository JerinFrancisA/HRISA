import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class DisplayBox extends StatelessWidget {
  final topText;
  final text;
  Function onTap = () {};

  DisplayBox({@required this.topText, @required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: kFieldBoxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                topText,
                textAlign: TextAlign.left,
                style: kHrisaText.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 3.0,
                  color: kLabelTextColor,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                text,
                style: kHrisaText.copyWith(
                  fontSize: 20.0,
                  color: kTextFormFieldTextColor,
                ),
              ),
              SizedBox(height: 22.0),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Update BMI',
                  style: kHrisaText.copyWith(
                    fontSize: 15.0,
                    color: kBottomButtonColor.withOpacity(0.85),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
