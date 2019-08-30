import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/medical_history_page.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/display_box.dart';
import 'package:hrisa/utilities/constants.dart';

enum HeightUnit { cm, inch }

class Screening extends StatefulWidget {
  static const routeName = 'Screening';

  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  final _formKey = GlobalKey<FormState>();
  bool isCm = true, isInch = false;

  //TextFields. Declared separately so as to get the values to store in FireBase.

  var hrisaHeightCm = InputBox(
    text: 'Height',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Height in cms',
  );
  var feet = InputBox(
    text: 'Feet',
    keyBoardType: TextInputType.number,
    hintText: 'Enter feet',
  );
  var inches = InputBox(
    text: 'Inches',
    keyBoardType: TextInputType.number,
    hintText: 'Enter inches',
  );
  double hrisaHeightInchValueAfterConversion;
  var hrisaWeight = InputBox(
    text: 'Weight',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Weight in kgs',
  );
  var hrisaBloodPressure = InputBox(
    text: 'Systolic Blood Pressure',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Blood Pressure',
  );
  var hrisaDiastolicBloodPressure = InputBox(
    text: 'Diastolic Blood Pressure',
    keyBoardType: TextInputType.number,
    hintText: 'Enter Diastolic Blood Pressure',
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
  var hrisaWaistCircumference = InputBox(
    text: 'Waist Circumference',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Waist Circumference',
    validator: (val) => val.isEmpty ? null : null,
  );
  var hrisaHipCircumference = InputBox(
    text: 'Hip Circumference',
    keyBoardType: TextInputType.number,
    hintText: '(Optional) Enter Hip Circumference',
    validator: (val) => val.isEmpty ? null : null,
  );

//  var hrisaWaistHipRatio = InputBox(
//    text: 'Waist Hip Ratio',
//    keyBoardType: TextInputType.number,
//    hintText: '(Optional) Enter Waist Hip ratio',
//    validator: (val) => val.isEmpty ? null : null,
//  );
  double hrisaBmi = 0.0;
  String hrisaWaistHipRatio = '';

  void calcBmiCm() {
    _submitForm();
    var height = hrisaHeightCm.input;
    var weight = hrisaWeight.input;
    hrisaBmi = double.parse(weight) / pow((double.parse(height) / 100), 2);
  }

  void calcBmiInches() {
    _submitForm();
    var heightFeet = feet.input;
    var heightInches = inches.input;
    double height = (double.parse(heightFeet) * 30.48) +
        (double.parse(heightInches) * 2.54);
    hrisaHeightInchValueAfterConversion = height;
    var weight = hrisaWeight.input;
    hrisaBmi = double.parse(weight) /
        pow((hrisaHeightInchValueAfterConversion / 100), 2);
  }

  void calcWaistHipRatio() {
    _submitForm();
    var waistCirumference = hrisaWaistCircumference.input;
    var hipCircumference = hrisaHipCircumference.input;
    hrisaWaistHipRatio =
        (double.parse(waistCirumference) / double.parse(hipCircumference))
            .toStringAsFixed(2);
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
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          isCm ? 'ft/inch' : 'cm',
                          style: kHrisaText.copyWith(fontSize: 12.0),
                        ),
                        onPressed: () {
                          setState(() {
                            isCm = !isCm;
                            isInch = !isInch;
                          });
                        },
                      ),
                      Visibility(
                        visible: isCm,
                        child: hrisaHeightCm,
                      ),
                      Visibility(
                        visible: isInch,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            feet,
                            inches,
                          ],
                        ),
                      ),
                    ],
                  ),
                  hrisaWeight,
                  GestureDetector(
                    onTap: () {
                      if (isCm) {
                        calcBmiCm();
                      } else {
                        calcBmiInches();
                      }
                      setState(() {});
                    },
                    child: DisplayBox(
                      topText: 'BMI',
                      text: hrisaBmi.toStringAsFixed(2),
                      onTap: () {
                        if (isCm) {
                          calcBmiCm();
                        } else {
                          calcBmiInches();
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  hrisaBloodPressure,
                  hrisaDiastolicBloodPressure,
                  hrisaHeartRate,
                  hrisaOxygenSaturation,
                  hrisaCholestrolLevel,
                  hrisaWaistCircumference,
                  hrisaHipCircumference,
                  GestureDetector(
                    onTap: () {
                      calcWaistHipRatio();
                      setState(() {});
                    },
                    child: DisplayBox(
                      topText: 'Waist Hip Ratio',
                      text: hrisaWaistHipRatio,
                      onTap: () {
                        if (isCm) {
                          calcBmiCm();
                        } else {
                          calcBmiInches();
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  //hrisaWaistHipRatio,
                  BottomButton(
                    text: 'Next',
                    onPressed: () {
                      if (isCm) {
                        calcBmiCm();
                      } else {
                        calcBmiInches();
                      }
                      _submitForm();

                      hrisaValues.hrisaHeight = isCm
                          ? hrisaHeightCm.input
                          : hrisaHeightInchValueAfterConversion;
                      hrisaValues.hrisaWeight = hrisaWeight.input;
                      hrisaValues.hrisaBmi = hrisaBmi.toStringAsFixed(2) ?? 0.0;
                      hrisaValues.hrisaHeartRate = hrisaHeartRate.input;
                      hrisaValues.hrisaBloodPressure = hrisaBloodPressure.input;
                      hrisaValues.hrisaDiastolicBloodPressure =
                          hrisaDiastolicBloodPressure.input;
                      hrisaValues.hrisaOxygenSaturation =
                          hrisaOxygenSaturation.input;
                      hrisaValues.hrisaCholestrolLevel =
                          hrisaCholestrolLevel.input;
                      hrisaValues.hrisaWaistHipRatio = hrisaWaistHipRatio;

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
