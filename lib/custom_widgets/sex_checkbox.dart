import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

/// [SexCheckbox] extends a [StatefulWidget] and is used ONLY in the
/// screens/input_page.dart to select the Sex of the person being screened.
///
/// An enum Sex is used with four values. [Sex.NONE] value is not rendered in the
/// screen and is used to keep the Sex unselected initially so that the patient
/// can select the Sex manually.
///
/// The [input] property is used to get the value of the Sex selected currently.
///
/// [ListTile] is used as a CheckBox with [ListTile.leading] being the [Radio]
/// widget and the [ListTile.title] being the Sex category.

enum Sex { NONE, MALE, FEMALE, TRANSGENDER }
//NONE is not rendered on screen. It is to keep sex unchecked initially.

class SexCheckbox extends StatefulWidget {
  var input = Sex.NONE.toString();

  @override
  _SexCheckboxState createState() => _SexCheckboxState();
}

class _SexCheckboxState extends State<SexCheckbox> {
  Sex _character = Sex.NONE;
  final _formKey = GlobalKey<FormState>();

  void setInputValue(x) {

    /// [widget] is a powerful property which can be thought as an analogue of
    /// super keyword in any OOP paradigm. widget keyword can be used to access
    /// thr properties of the Super class of this State class.

    x == Sex.MALE
        ? widget.input = 'Male'
        : x == Sex.FEMALE
            ? widget.input = 'Female'
            : widget.input = 'Transgender';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kFieldBoxColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormField(
            key: _formKey,
            validator: (val) =>
                (widget.input == 'Sex.NONE' ? 'Can\'t be empty' : null),
            builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Sex',
                        textAlign: TextAlign.left,
                        style: kHrisaText.copyWith(
                          fontSize: 12.0,
                          letterSpacing: 3.0,
                          color: kLabelTextColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Male',
                        style: kHrisaText.copyWith(
                          fontSize: 15.0,
                          color: kTextFormFieldTextColor,
                        ),
                      ),
                      leading: Radio(
                        activeColor: kBottomButtonColor,
                        value: Sex.MALE,
                        groupValue: _character,
                        onChanged: (Sex value) {
                          setState(() {
                            _character = value;
                            setInputValue(_character);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Female',
                        style: kHrisaText.copyWith(
                          fontSize: 15.0,
                          color: kTextFormFieldTextColor,
                        ),
                      ),
                      leading: Radio(
                        activeColor: kBottomButtonColor,
                        value: Sex.FEMALE,
                        groupValue: _character,
                        onChanged: (Sex value) {
                          setState(() {
                            _character = value;
                            setInputValue(_character);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Transgender',
                        style: kHrisaText.copyWith(
                          fontSize: 15.0,
                          color: kTextFormFieldTextColor,
                        ),
                      ),
                      leading: Radio(
                        activeColor: kBottomButtonColor,
                        value: Sex.TRANSGENDER,
                        groupValue: _character,
                        onChanged: (Sex value) {
                          setState(() {
                            _character = value;
                            setInputValue(_character);
                          });
                        },
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
