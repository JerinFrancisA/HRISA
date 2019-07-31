import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';

class Screening extends StatefulWidget {
  @override
  _ScreeningState createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: <Widget>[
              Text(
                'SCREENING PATIENT',
                style: kHrisaText,
              ),
              BottomButton(text: 'DONE', route: null),
            ],
          ),
        ),
      ),
    );
  }
}