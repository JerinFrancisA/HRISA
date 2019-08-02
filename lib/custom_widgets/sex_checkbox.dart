import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

enum SingingCharacter { NONE, MALE, FEMALE, TRANSGENDER }
//NONE is not rendered on screen. It is to keep sex unchecked initially.

class SexCheckbox extends StatefulWidget {
  @override
  _SexCheckboxState createState() => _SexCheckboxState();
}

class _SexCheckboxState extends State<SexCheckbox> {
  SingingCharacter _character = SingingCharacter.NONE;

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
          child: Column(
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
                  value: SingingCharacter.MALE,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
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
                  value: SingingCharacter.FEMALE,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
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
                  value: SingingCharacter.TRANSGENDER,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
