import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/date_of_birth.dart';
import 'package:hrisa/custom_widgets/age.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:intl/intl.dart';

String selectedValue;

class FindAge {
  String toFindAge;
  int pAge = 0;

  void findAge(selected) {
    toFindAge = DateFormat('dd/MM/yyyy').format(selected);
    int day;
    int month;
    int year;
    day = int.parse(toFindAge.substring(0, 2));
    month = int.parse(toFindAge.substring(3, 5));
    year = int.parse(toFindAge.substring(6, 10));

    pAge = DateTime.now().year - year;
    (DateTime.now().month - month <= 0)
        ? (DateTime.now().month - month < 0)
            ? pAge -= 1
            : (DateTime.now().day - day < 0) ? pAge -= 1 : pAge += 0
        : pAge += 0;
    print('in function $pAge');
  }
}

class MyCalendar extends StatefulWidget {
  final ageOrDob;

  MyCalendar({@required this.ageOrDob});

  @override
  _MyCalendarState createState() => _MyCalendarState(ageOrDob: ageOrDob);
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime selected;
  var dob;
  final ageOrDob;
  FindAge findThroughCall = FindAge();

  _MyCalendarState({@required this.ageOrDob});

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2020),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          //TODO 2: Customize calendar
          child: child,
        );
      },
    );
    setState(() {
      findThroughCall.findAge(selected);
      print('from setDate ${findThroughCall.pAge}');
    });
    //selectedValue = DateFormat('dd/MM/yyyy').format(selected);
  }

  @override
  Widget build(BuildContext context) {
    dob = (selected != null)
        ? new MyDate(
            selected: selected,
            ageOrDob: ageOrDob,
          )
        : new MyDate(
            selected: DateTime.now(),
            ageOrDob: ageOrDob,
          );

    return Column(
      children: <Widget>[
        dob,
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RaisedButton(
            padding: EdgeInsets.all(15.0),
            splashColor: kLabelTextColor,
            highlightColor: kTextFormFieldTextColor,
            onPressed: () {
              _showDateTimePicker();
            },
            elevation: 5.0,
            child: Opacity(
              opacity: 0.6,
              child: Icon(
                Icons.calendar_today,
                color: kTextFormFieldTextColor,
                size: 40.0,
              ),
            ),
          ),
        ),
        MyAge(
          ageOrDob: 'AGE',
          ageText: findThroughCall.pAge.toString(),
        ),
      ],
    );
  }
}
