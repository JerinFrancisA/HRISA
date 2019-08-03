import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {@required this.text, this.value = false, @required this.onChanged});

  final text;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
            activeColor: kBottomButtonColor,
          ),
          Text(
            text,
            style: kHrisaText.copyWith(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
