import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/display_box.dart';
import 'package:hrisa/utilities/constants.dart';

class BMI {
  double bmi = 0;

  double calcBmi({double height = 0.0, double weight = 0.0}) {
    bmi = weight / pow((height / 100), 2);
    return bmi;
  }
}

class Screening extends StatefulWidget {
  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  final _formKey = GlobalKey<FormState>();
  InputBox height = InputBox(
    text: 'Height',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Height in cms',
  );
  InputBox weight = InputBox(
    text: 'Weight',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Weight in kgs',
  );
  BMI myBmi = BMI();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Demographics',
            style: kHrisaText,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Vital Parameters',
                      style: kHrisaText.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3.0,
                        color: kHeadingColor,
                      ),
                    ),
                  ),
                  height,
                  weight,
                  DisplayBox(
                    topText: 'BMI',
                    text: '0.0',
                  ),
                  InputBox(
                    text: 'Cholestrol level',
                    keyBoardType: TextInputType.number,
                    hintText: '(Optional) Enter Cholestrol level',
                  ),
                  InputBox(
                    text: 'Waist Hip Ratio',
                    keyBoardType: TextInputType.number,
                    hintText: '(Optional) Enter Waist Hip ratio',
                  ),
                  BottomButton(text: 'Next', route: 'MedicalHistory'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
