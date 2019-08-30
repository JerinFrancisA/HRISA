import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

/// [CustomCheckBox] is the second most used widget in this application. It extends
/// [StatelessWidget] but is passed inside a [StatefulWidget] to make it change
/// state.
///
/// [text] is a required parameter which essentially is the text of the Check box.
///
/// [value] is the most important property of this widget. It is used to trap
/// or get the value of the current Check Box state, i.e true/false value of the
/// Check Box is obtained through this [value] property.
///
/// The Function [onChanged] property is also a required property, which is then
/// used to toggle the value of the check box between true and false.
///
/// [InkWell] widget is used to make the whole 'strip' of the checkbox in the
/// manner of speaking, 'interactive'. So, whenever any part of the checkbox is
/// clicked the value is toggled.

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
