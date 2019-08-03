import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

enum SingingCharacter { YES, NO }
//NONE is not rendered on screen. It is to keep sex unchecked initially.

class YesNoRadio extends StatefulWidget {
  final text;
  YesNoRadio({@required this.text});

  @override
  _YesNoRadioState createState() => _YesNoRadioState(text: text);
}

class _YesNoRadioState extends State<YesNoRadio> {
  SingingCharacter _character = SingingCharacter.NO;
  final text;
  _YesNoRadioState({@required this.text});

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
                  text,
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
                  'Yes',
                  style: kHrisaText.copyWith(
                    fontSize: 15.0,
                    color: kTextFormFieldTextColor,
                  ),
                ),
                leading: Radio(
                  activeColor: kBottomButtonColor,
                  value: SingingCharacter.YES,
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
                  'No',
                  style: kHrisaText.copyWith(
                    fontSize: 15.0,
                    color: kTextFormFieldTextColor,
                  ),
                ),
                leading: Radio(
                  activeColor: kBottomButtonColor,
                  value: SingingCharacter.NO,
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
