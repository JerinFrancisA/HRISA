import 'package:flutter/material.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/who_ish_risk_page.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/yes_no_radio.dart';
import 'package:hrisa/custom_widgets/custom_check_box.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/heading_text.dart';
import 'package:hrisa/custom_widgets/sub_heading_text.dart';
import 'package:hrisa/utilities/constants.dart';

class MedicalHistory extends StatefulWidget {
  static const routeName = 'MedicalHistory';

  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final _formKey = GlobalKey<FormState>();

  //TextFields. Declared separately so as to get the values to store in FireBase.

  var hrisaDiabetesMellitius = YesNoRadio(
    text: 'Diabetes Mellitius',
    drugRadio: true,
  );
  String hrisaDiabetesMellitiusDrugString =
      ''; // to make string with comma separated drug names
  var hrisaHypertension = YesNoRadio(
    text: 'Hypertension',
    drugRadio: true,
  );
  String hrisaHypertensionDrugString =
      ''; // to make string with comma separated drug names
  var hrisaSmoker = YesNoRadio(
    text: 'Smoker',
    drugRadio: false,
  );
  var hrisaAlcoholic = YesNoRadio(
    text: 'Alcoholic',
    drugRadio: false,
  );
  bool hrisaChronicHeartDisease = false; //initial value of checkbox 1
  bool hrisaIschemicHeartDisease = false; //initial value of checkbox 2
  bool hrisaStroke = false; //initial value of checkbox 3
  bool hrisaHeartFailure = false; //initial value of checkbox 4
  bool hrisaAsthma = false; //initial value of checkbox 5
  bool hrisaSeizures = false; //initial value of checkbox 6
  bool hrisaThyroidDisease = false; //initial value of checkbox 7
  bool hrisaCOPD = false; //initial value of checkbox 8
  List<bool> hrisaOtherConditionExist = List.filled(8, false, growable: true);
  String hrisaOtherConditionString = '';
  List<String> hrisaOtherConditionNames = [
    'Ischemic Heart Disease',
    'Stroke',
    'Heart failure',
    'Seizures',
    'Asthma',
    'Chronic Kidney Disease',
    'Thyroid Disease',
    'COPD',
  ];
  var hrisaOtherConditions = InputBox(
    text: 'Any Other Conditions',
    hintText: 'Specify any other medical condition(s)',
    validator: (val) => val.isEmpty ? null : null,
  );

  // variables to set visibility for Visibility widget for diabetic patients
  List<bool> hrisaDiabetesDrug = List.filled(6, false, growable: true);
  List<String> hrisaDiabetesDrugNames = [
    'Insulin',
    'Sulphonylureas',
    'Biguanides',
    'Thiazolidinediones',
    'Alpha Glucosidase inhibitors',
    'Glucagon (peptide 1)',
  ];
  var hrisaOtherDiabetesDrugs = InputBox(
    text: 'Others if any (Diabetes)',
    hintText: 'Specify any other drugs taken',
    validator: (val) => val.isEmpty ? null : null,
  );

  // variables to set visibility for Visibility widget for hypertensive patients
  List<bool> hrisaHypertensionDrug = List.filled(12, false, growable: true);
  List<String> hrisaHypertensionDrugNames = [
    'Thiazide diuretics',
    'LOOP diuretics',
    'Potassium sparing diuretics',
    'Alpha blockers',
    'Beta blockers',
    'Alpha + Beta blockers',
    'Calcium channel blockers',
    'ACE inhibitors',
    'Angiotensin Receptor Blockers',
    'Arterial dilators',
    'Nitrodilators',
    'Centrally acting sympatholytics',
  ];
  var hrisaOtherHypertensionDrugs = InputBox(
    text: 'Others if any (Hypertension)',
    hintText: 'Specify any other drugs taken',
    validator: (val) => val.isEmpty ? null : null,
  );

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
  }

  @override
  Widget build(BuildContext context) {
    List<CustomCheckBox> hrisaDiabetesDrugWidgetList = List(6);
    for (int i = 0; i < 6; i++) {
      hrisaDiabetesDrugWidgetList[i] = CustomCheckBox(
        text: hrisaDiabetesDrugNames[i],
        value: hrisaDiabetesDrug[i],
        onChanged: (bool newVal) {
          setState(() {
            hrisaDiabetesDrug[i] = newVal;
          });
        },
      );
    }

    List<CustomCheckBox> hrisaHypertensionDrugWidgetList = List(12);
    for (int i = 0; i < 12; i++) {
      hrisaHypertensionDrugWidgetList[i] = CustomCheckBox(
        text: hrisaHypertensionDrugNames[i],
        value: hrisaHypertensionDrug[i],
        onChanged: (bool newVal) {
          setState(() {
            hrisaHypertensionDrug[i] = newVal;
          });
        },
      );
    }

    List<CustomCheckBox> hrisaOtherConditionsWidgetList = List(8);
    for (int i = 0; i < 8; i++) {
      hrisaOtherConditionsWidgetList[i] = CustomCheckBox(
        text: hrisaOtherConditionNames[i],
        value: hrisaOtherConditionExist[i],
        onChanged: (bool newVal) {
          setState(() {
            hrisaOtherConditionExist[i] = newVal;
          });
        },
      );
    }

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
                  HeadingText(
                    text: 'Medical History',
                  ),
                  GestureDetector(
                    child: hrisaDiabetesMellitius,
                    onTap: () {
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: hrisaDiabetesMellitius.hrisaOption ?? false,
                    child: Column(
                      children: <Widget>[
                        SubHeadingText(text: 'Choose drugs taken for Diabetes'),
                        hrisaDiabetesDrugWidgetList[0],
                        hrisaDiabetesDrugWidgetList[1],
                        hrisaDiabetesDrugWidgetList[2],
                        hrisaDiabetesDrugWidgetList[3],
                        hrisaDiabetesDrugWidgetList[4],
                        hrisaDiabetesDrugWidgetList[5],
                        hrisaOtherDiabetesDrugs,
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: hrisaHypertension,
                    onTap: () {
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: hrisaHypertension.hrisaOption ?? false,
                    child: Column(
                      children: <Widget>[
                        SubHeadingText(
                            text: 'Choose drugs taken for Hypertension'),
                        hrisaHypertensionDrugWidgetList[0],
                        hrisaHypertensionDrugWidgetList[1],
                        hrisaHypertensionDrugWidgetList[2],
                        hrisaHypertensionDrugWidgetList[3],
                        hrisaHypertensionDrugWidgetList[4],
                        hrisaHypertensionDrugWidgetList[5],
                        hrisaHypertensionDrugWidgetList[6],
                        hrisaHypertensionDrugWidgetList[7],
                        hrisaHypertensionDrugWidgetList[8],
                        hrisaHypertensionDrugWidgetList[9],
                        hrisaHypertensionDrugWidgetList[10],
                        hrisaHypertensionDrugWidgetList[11],
                        hrisaOtherHypertensionDrugs,
                      ],
                    ),
                  ),
                  hrisaSmoker,
                  hrisaAlcoholic,
                  SubHeadingText(
                    text: 'Other diseases if any',
                  ),
                  hrisaOtherConditionsWidgetList[0],
                  hrisaOtherConditionsWidgetList[1],
                  hrisaOtherConditionsWidgetList[2],
                  hrisaOtherConditionsWidgetList[3],
                  hrisaOtherConditionsWidgetList[4],
                  hrisaOtherConditionsWidgetList[5],
                  hrisaOtherConditionsWidgetList[6],
                  hrisaOtherConditionsWidgetList[7],
                  hrisaOtherConditions,
                  BottomButton(
                    text: 'Next',
                    onPressed: () {
                      _submitForm();

                      //Diabetes Details
                      hrisaValues.hrisaDiabetesMellitius =
                          hrisaDiabetesMellitius.hrisaOption ?? false;
                      hrisaDiabetesMellitiusDrugString =
                          ''; // if user comes back to change something the drug list is appended to previous drug list so initializing it back to '' (empty string)
                      int j = 0;
                      for (int i = 0; i < 6; i++) {
                        if (hrisaDiabetesDrug[i] == true &&
                            (hrisaDiabetesMellitius.hrisaOption ?? false)) {
                          hrisaDiabetesMellitiusDrugString += ' ' +
                              (j + 1).toString() +
                              '. ' +
                              hrisaDiabetesDrugNames[i];
                          j += 1;
                        }
                      }
                      if (hrisaOtherDiabetesDrugs.input != null &&
                          (hrisaDiabetesMellitius.hrisaOption ?? false)) {
                        hrisaDiabetesMellitiusDrugString += ' ' +
                            (j + 1).toString() +
                            '. ' +
                            hrisaOtherDiabetesDrugs.input;
                        hrisaOtherDiabetesDrugs.input = '';
                      }
                      hrisaValues.hrisaDiabetesMellitiusDrugString =
                          hrisaDiabetesMellitiusDrugString;

                      //Hypertension Details
                      hrisaValues.hrisaHypertension =
                          hrisaHypertension.hrisaOption ?? false;
                      hrisaHypertensionDrugString =
                          ''; // if user comes back to change something the drug list is appended to previous drug list so initializing it back to '' (empty string)
                      j = 0;
                      for (int i = 0; i < 12; i++) {
                        if (hrisaHypertensionDrug[i] == true &&
                            (hrisaHypertension.hrisaOption ?? false)) {
                          hrisaHypertensionDrugString += ' ' +
                              (j + 1).toString() +
                              '. ' +
                              hrisaHypertensionDrugNames[i];
                          j += 1;
                        }
                      }
                      if (hrisaOtherHypertensionDrugs.input != null &&
                          (hrisaHypertension.hrisaOption ?? false)) {
                        hrisaHypertensionDrugString += ' ' +
                            (j + 1).toString() +
                            '. ' +
                            hrisaOtherHypertensionDrugs.input;
                        hrisaOtherHypertensionDrugs.input = '';
                      }
                      hrisaValues.hrisaHypertensionDrugString =
                          hrisaHypertensionDrugString;
                      hrisaValues.hrisaSmoker =
                          hrisaSmoker.hrisaOption ?? false;
                      hrisaValues.hrisaAlcoholic =
                          hrisaAlcoholic.hrisaOption ?? false;

                      //Other Conditions Details
                      hrisaOtherConditionString =
                          ''; // if user comes back to change something the drug list is appended to previous drug list so initializing it back to '' (empty string)
                      j = 0;
                      for (int i = 0; i < 8; i++) {
                        if (hrisaOtherConditionExist[i] == true) {
                          hrisaOtherConditionString += ' ' +
                              (j + 1).toString() +
                              '. ' +
                              hrisaOtherConditionNames[i];
                          j += 1;
                        }
                      }
                      if (hrisaOtherConditions.input != null) {
                        hrisaOtherConditionString += ' ' +
                            (j + 1).toString() +
                            '. ' +
                            hrisaOtherConditions.input;
                      }
                      hrisaValues.hrisaOtherConditionsString =
                          hrisaOtherConditionString.substring(
                              0, hrisaOtherConditionString.length);

                      hrisaValues.printHrisaValues3();
                      j = 0;

                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(context, RiskScore.routeName);
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
