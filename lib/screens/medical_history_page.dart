import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/display_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/yes_no_radio.dart';
import 'package:hrisa/custom_widgets/custom_check_box.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/utilities/constants.dart';

class MedicalHistory extends StatefulWidget {
  static const routeName = 'MedicalHistory';
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final _formKey = GlobalKey<FormState>();
  bool condition1 = false; //initial value of checkbox 1
  bool condition2 = false; //initial value of checkbox 2
  bool condition3 = false; //initial value of checkbox 3
  bool condition4 = false; //initial value of checkbox 4
  bool condition5 = false; //initial value of checkbox 5
  bool condition6 = false; //initial value of checkbox 6

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
                      'Medical History',
                      style: kHrisaText.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3.0,
                        color: kHeadingColor,
                      ),
                    ),
                  ),
                  YesNoRadio(text: 'Diabetes Mellitius'),
                  YesNoRadio(text: 'Hypertension'),
                  YesNoRadio(text: 'Smoker'),
                  DisplayBox(topText: 'Other', text: 'Select other diseases'),
                  // TODO 4: Implement drop down
                  CustomCheckBox(
                    text: 'Ischemic Heart Disease',
                    value: condition1,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition1 = newVal;
                      });
                    },
                  ),
                  CustomCheckBox(
                    text: 'Stroke',
                    value: condition2,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition2 = newVal;
                      });
                    },
                  ),
                  CustomCheckBox(
                    text: 'Asthma',
                    value: condition3,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition3 = newVal;
                      });
                    },
                  ),
                  CustomCheckBox(
                    text: 'Seizures',
                    value: condition4,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition4 = newVal;
                      });
                    },
                  ),
                  CustomCheckBox(
                    text: 'Thyroid Disease',
                    value: condition5,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition5 = newVal;
                      });
                    },
                  ),
                  CustomCheckBox(
                    text: 'COPD',
                    value: condition6,
                    onChanged: (bool newVal) {
                      setState(() {
                        condition6 = newVal;
                      });
                    },
                  ),
                  InputBox(
                    text: 'Any Other Conditions',
                    hintText: 'Specify any other medical condition(s)',
                  ),
                  BottomButton(text: 'Next', route: 'RiskScore'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
