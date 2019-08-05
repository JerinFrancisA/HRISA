import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';

class RiskScore extends StatefulWidget {
  static const routeName = 'RiskScore';
  @override
  _RiskScoreState createState() => _RiskScoreState();
}

class _RiskScoreState extends State<RiskScore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'WHO/ISH Risk',
            style: kHrisaText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: <Widget>[
              Text(
                'Risk Score',
                style: kHrisaText.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(height: 80.0),
              Text(
                '40%',
                style: kHrisaText.copyWith(
                  fontSize: 90.0,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(height: 60.0),
              BottomButton(text: 'Recommendation', route: 'Recommendation'),
            ],
          ),
        ),
      ),
    );
  }
}
