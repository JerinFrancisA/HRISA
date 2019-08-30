import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/date_of_birth.dart';
import 'package:hrisa/custom_widgets/age.dart';
import 'package:hrisa/custom_widgets/sub_heading_text.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:intl/intl.dart';

///The initial DOB and Age values are stored in these variables.

var hrisaDob = DateTime.now().toString();
var hrisaAge = 0;

class FindAge {
  String toFindAge;
  int pAge = 0;

  /// This function is the most important part of this file. It calculates the
  /// Age and updates it to [MyAge] class so that the user need not enter the
  /// Age manually.

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
    if (pAge < 0) {
      pAge = 0;
    }
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
  final _formKey = GlobalKey<FormState>();

  _MyCalendarState({@required this.ageOrDob});

  /// Opens calendar with the initial value of [initialDate] and the minimum value
  /// of Date is set by [firstDate] and the maximum value is set by [lastDate].
  /// [builder] is the calendar which will be opened. It can be customised by
  /// returning a [Theme] and the [Theme.data] property can be modified.

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            accentColor: kBottomButtonColor,
            primaryColor: kHeadingColor,
            backgroundColor: kAppBarColor,
          ),
          child: child,
        );
      },
    );
    setState(() {
      findThroughCall.findAge(selected);
      hrisaDob = DateFormat('dd/MM/yyyy').format(selected);
      hrisaAge = findThroughCall.pAge;
      print('\'$hrisaAge\'\n\'$hrisaDob\'');
    });
    //selectedValue = DateFormat('dd/MM/yyyy').format(selected);
  }

  /// Using ternary operator to set [Mydate.ageText] to today's date if null
  /// initially or to the date which is set by user(selected).

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

    return FormField(
      autovalidate: true,
      key: _formKey,
      validator: (val) =>
          (hrisaAge.toString() == '0' ? 'Can\'t be empty' : null),
      builder: (context) => Column(
            children: <Widget>[
              SubHeadingText(text: 'Select DOB from Calendar'),
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

                  /// To display calendar icon with certain opacity.

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
              GestureDetector(
                child: dob,
                onTap: () {
                  _showDateTimePicker();
                },
              ),
              GestureDetector(
                onTap: () {
                  _showDateTimePicker();
                },
                child: MyAge(
                  ageOrDob: 'AGE',
                  ageText: findThroughCall.pAge.toString(),
                ),
              ),
            ],
          ),
    );
  }
}
