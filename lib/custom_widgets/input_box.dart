import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

class InputBox extends StatelessWidget {
  final text;
  final keyBoardType;
  final maxLines;
  final big;
  final maxLength;
  final cap;
  final hintText;
  final initialValue;

  InputBox({
    @required this.text,
    this.keyBoardType = TextInputType.text,
    this.maxLines = 1,
    this.big = 26.0,
    this.maxLength,
    this.cap = TextCapitalization.none,
    this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textCapitalization: cap,
        style: kHrisaText.copyWith(
          fontSize: 20.0,
          color: kTextFormFieldTextColor,
        ),
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyBoardType,
        initialValue: initialValue,
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
          filled: true,
          fillColor: kFieldBoxColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
      ),
    );
  }
}