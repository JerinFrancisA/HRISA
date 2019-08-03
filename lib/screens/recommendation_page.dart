import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/utilities/advices.dart';

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recommendation',
            style: kHrisaText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView(
            children: <Widget>[
              Text(
                'Recommendation/Advice',
                style: kHrisaText.copyWith(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                advices[0],
                style: kHrisaText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              BottomButton(text: 'Finish', route: null),
              BottomButton(text: 'Print PDF', route: null),
              BottomButton(text: 'Screen Next', route: '/'),
            ],
          ),
        ),
      ),
    );
  }
}
