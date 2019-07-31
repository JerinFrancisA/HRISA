import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/sex_checkbox.dart';
import 'package:hrisa/screens/consent_screen.dart';
import 'package:hrisa/utilities/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  UserConsent userConsent = UserConsent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Patient Info',
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
                      'Fill in the following details',
                      style: kHrisaText.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3.0,
                        color: Color(0xFF3859C2),
                      ),
                    ),
                  ),
                  InputBox(
                    text: 'Name',
                    cap: TextCapitalization.characters,
                    hintText: 'Enter Name',
                  ),
                  InputBox(
                    text: 'DOB',
                    keyBoardType: TextInputType.datetime,
                    hintText: 'DD/MM/YYYY',
                  ),
                  //TODO 1: Show Age (calculate it from DOB)
                  //InputBox(text: 'Sex'),
                  SexCheckbox(),
                  InputBox(
                    text: 'Address',
                    maxLines: 7,
                    big: 56.0,
                    hintText: 'Enter Address',
                  ),
                  InputBox(
                    text: 'Phone',
                    maxLength: 10,
                    keyBoardType: TextInputType.number,
                    hintText: 'Enter 10 digit Phone number',
                  ),
                  BottomButton(text: 'GO', route: 'UserConsent'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
