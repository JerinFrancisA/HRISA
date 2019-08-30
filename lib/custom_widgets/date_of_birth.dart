import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:intl/intl.dart';

/// [MyDate] extends a [StatelessWidget] which is passed inside a [Stateful] widget
/// inside the screens/input_page.dart.
///
/// This widget is used to display the DOB in the application. When the user selects
/// date from the calendar it automatically updates the DOB and Age in the App.
///
/// The [ageOrDob] property is again to display text to indicate whether its 'Age'
/// or 'DOB'. So a proper string is to be passed.

class MyDate extends StatelessWidget {
  MyDate({@required this.selected, this.ageOrDob});

  final DateTime selected;
  final ageOrDob;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: kFieldBoxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ageOrDob,
                textAlign: TextAlign.left,
                style: kHrisaText.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 3.0,
                  color: kLabelTextColor,
                ),
              ),
              SizedBox(height: 10.0),
              Text(

                /// Set date format to dd/MM/yyy

                DateFormat('dd/MM/yyyy').format(selected),
                style: kHrisaText.copyWith(
                  fontSize: 20.0,
                  color: kTextFormFieldTextColor,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Select from Calendar',
                style: kHrisaText.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 3.0,
                  color: kLabelTextColor,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}