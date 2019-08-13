import 'package:flutter/material.dart';
import 'package:hrisa/screens/consent_screen.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/sex_checkbox.dart';
import 'package:hrisa/custom_widgets/calendar.dart';
import 'package:hrisa/custom_widgets/heading_text.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/utilities/hrisa_fields.dart';

Hrisa hrisaValues = Hrisa();

class InputPage extends StatefulWidget {
  static const routeName = 'InputPage';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  //TextFields. Declared separately so as to get the values to store in FireBase.

  var hrisaName = InputBox(
    text: 'Name',
    cap: TextCapitalization.characters,
    hintText: 'Enter Name',
  );
  var hrisaSex = SexCheckbox();
  var hrisaAddress = InputBox(
    text: 'Address',
    maxLines: 7,
    big: 56.0,
    hintText: 'Enter Address',
    cap: TextCapitalization.words,
  );

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
    if(hrisaSex.input.toString() == 'Sex.NONE') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kScaffoldBackgroundColor,
            title: Text(
              'Sex cannot be Empty',
              textAlign: TextAlign.center,
              style: kHrisaText.copyWith(
                color: kTextFormFieldTextColor,
              ),
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  'DISMISS',
                  style: kHrisaText.copyWith(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                fillColor: kBottomButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          );
        },
      );
    }
    if(hrisaAge.toString() == '0') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kScaffoldBackgroundColor,
            title: Text(
              'Age cannot be Empty',
              textAlign: TextAlign.center,
              style: kHrisaText.copyWith(
                color: kTextFormFieldTextColor,
              ),
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  'DISMISS',
                  style: kHrisaText.copyWith(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                fillColor: kBottomButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Patient Info',
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
                  HeadingText(text: 'Fill in the following details'),
                  hrisaName,
                  MyCalendar(ageOrDob: 'DOB'),
                  hrisaSex,
                  hrisaAddress,
                  BottomButton(
                    text: 'GO',
                    onPressed: () {
                      _submitForm();
                      hrisaValues.hrisaName = hrisaName.input;
                      hrisaValues.hrisaDob = hrisaDob;
                      hrisaValues.hrisaAge = hrisaAge;
                      hrisaValues.hrisaSex = hrisaSex.input;
                      hrisaValues.hrisaAddress = hrisaAddress.input;

                      hrisaValues.printHrisaValues1();

                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(context, UserConsent.routeName);
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