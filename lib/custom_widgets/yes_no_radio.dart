import 'package:flutter/material.dart';
import 'package:hrisa/utilities/constants.dart';

enum Option { YES, NO }

class YesNoRadio extends StatefulWidget {
  final bool drugRadio;
  final text;
  bool hrisaOption;

  YesNoRadio({@required this.text, @required this.drugRadio});

  @override
  _YesNoRadioState createState() => _YesNoRadioState(text: text);
}

class _YesNoRadioState extends State<YesNoRadio> {
  Option _character = Option.NO;
  final text;

  _YesNoRadioState({@required this.text});

  void setInputValue(x) {
    x == Option.YES ? widget.hrisaOption = true : widget.hrisaOption = false;
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
                  value: Option.YES,
                  groupValue: _character,
                  onChanged: (Option value) {
                    setState(() {
                      _character = value;
                      setInputValue(Option.YES);
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
                  value: Option.NO,
                  groupValue: _character,
                  onChanged: (Option value) {
                    setState(() {
                      _character = value;
                      setInputValue(Option.NO);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Visibility(
                visible: (widget.hrisaOption ?? false) &&
                    (widget.drugRadio ?? false),
                child: Container(
                  child: Text(
                    'Click to select drugs taken',
                    textAlign: TextAlign.center,
                    style: kHrisaText.copyWith(
                      fontSize: 15.0,
                      color: kBottomButtonColor.withOpacity(0.85),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
