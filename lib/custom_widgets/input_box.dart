import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class InputBox extends StatelessWidget {
  final text;
  final keyBoardType;
  final maxLines;
  final big;
  final maxLength;
  final cap;
  final obscureText;
  final hintText;
  final initialValue;
  final Function validator;
  var input;

  InputBox({
    @required this.text,
    this.keyBoardType = TextInputType.text,
    this.maxLines = 1,
    this.big = 26.0,
    this.maxLength,
    this.cap = TextCapitalization.none,
    this.hintText,
    this.initialValue,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: (val) {
          input = val;
        },
        textCapitalization: cap,
        style: kHrisaText.copyWith(
          fontSize: 20.0,
          color: kTextFormFieldTextColor,
        ),
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyBoardType,
        initialValue: initialValue,
        obscureText: obscureText,
        decoration: InputDecoration.collapsed(hintText: null).copyWith(
          contentPadding: EdgeInsets.all(big),
          labelText: text,
          labelStyle: kHrisaText.copyWith(
            fontSize: 16.0,
            letterSpacing: 3.0,
            color: kLabelTextColor,
          ),
          hintText: hintText,
          hintStyle: kHrisaText.copyWith(
            fontSize: 12.0,
            letterSpacing: 3.0,
            color: kHintTextColor,
          ),
          errorStyle: kHrisaText.copyWith(
            fontSize: 10.0,
            letterSpacing: 2.0,
            color: kBottomButtonColor.withOpacity(0.8),
          ),
          filled: true,
          fillColor: kFieldBoxColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator??((val) => val.isEmpty ? '$text is required' : null),
      ),
    );
  }
}