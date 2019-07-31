import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/screens/screening_screen.dart';

class UserConsent extends StatefulWidget {
  @override
  _UserConsentState createState() => _UserConsentState();
}

class _UserConsentState extends State<UserConsent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Consent',
            style: kHrisaText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: <Widget>[
              Text(
                'Consent Screen',
                style: kHrisaText,
              ),
              BottomButton(text: 'START SCREENING', route: 'Screening'),
            ],
          ),
        ),
      ),
    );
  }
}
