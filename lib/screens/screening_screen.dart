import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/medical_history_page.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/display_box.dart';
import 'package:hrisa/utilities/constants.dart';

class Screening extends StatefulWidget {
  static const routeName = 'Screening';

  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  final _formKey = GlobalKey<FormState>();

  //TextFields. Declared separately so as to get the values to store in FireBase.

  var hrisaHeight = InputBox(
    text: 'Height',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Height in cms',
  );
  var hrisaWeight = InputBox(
    text: 'Weight',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Weight in kgs',
  );
  var hrisaBloodPressure = InputBox(
    text: 'Blood Pressure',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Blood Pressure',
  );
  var hrisaHeartRate = InputBox(
    text: 'Heart Rate',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Heart Rate',
    validator: (val) => val.isEmpty ? null : null,
  );
  var hrisaOxygenSaturation = InputBox(
    text: 'Oxygen Saturation',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Oxygen Saturation',
    validator: (val) => val.isEmpty ? null : null,
  );
  var hrisaCholestrolLevel = InputBox(
    text: 'Cholestrol level',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Cholestrol level',
    validator: (val) => val.isEmpty ? null : null,
  );
  var hrisaWaistHipRatio = InputBox(
    text: 'Waist Hip Ratio',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Waist Hip ratio',
    validator: (val) => val.isEmpty ? null : null,
  );
  double hrisaBmi = 0.0;

  void calcBmi() {
    _submitForm();
    var height = hrisaHeight.input;
    var weight = hrisaWeight.input;
    hrisaBmi = double.parse(weight) / pow((double.parse(height) / 100), 2);
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
    //calcBmi();
  }

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
              autovalidate: true,
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
                  hrisaHeight,
                  hrisaWeight,
                  GestureDetector(
                    onTap: () {
                      calcBmi();
                      setState(() {});
                    },
                    child: DisplayBox(
                      topText: 'BMI',
                      text: hrisaBmi.toStringAsFixed(2),
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ),
                  hrisaBloodPressure,
                  hrisaHeartRate,
                  hrisaOxygenSaturation,
                  hrisaCholestrolLevel,
                  hrisaWaistHipRatio,
                  BottomButton(
                    text: 'Next',
                    onPressed: () {
                      calcBmi();
                      _submitForm();

                      hrisaValues.hrisaHeight = hrisaHeight.input;
                      hrisaValues.hrisaWeight = hrisaWeight.input;
                      hrisaValues.hrisaBmi = hrisaBmi.toStringAsFixed(2) ?? 0.0;
                      hrisaValues.hrisaHeartRate = hrisaHeartRate.input;
                      hrisaValues.hrisaBloodPressure = hrisaBloodPressure.input;
                      hrisaValues.hrisaOxygenSaturation =
                          hrisaOxygenSaturation.input;
                      hrisaValues.hrisaCholestrolLevel =
                          hrisaCholestrolLevel.input;
                      hrisaValues.hrisaWaistHipRatio = hrisaWaistHipRatio.input;

                      hrisaValues.printHrisaValues2();

                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(context, MedicalHistory.routeName);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
