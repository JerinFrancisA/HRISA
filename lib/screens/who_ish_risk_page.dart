import 'package:flutter/material.dart';
import 'package:hrisa/screens/recommendation_page.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/utilities/risk_value.dart';
import 'package:hrisa/utilities/advices.dart';

class RiskScore extends StatefulWidget {
  static const routeName = 'RiskScore';

  @override
  _RiskScoreState createState() => _RiskScoreState();
}

class _RiskScoreState extends State<RiskScore> {
  String refv;
  String hrisaRisk;

  String setAge() {
    if (hrisaValues.hrisaAge >= 70) {
      return '70';
    }
    return hrisaValues.hrisaAge.toString().substring(0, 1) + '0';
  }

  String setSex() {
    if (hrisaValues.hrisaSex == 'Male' || hrisaValues.hrisaSex == 'Transgender')
      return '1';
    else
      return '0';
  }

  String setDiabetes() {
    if (hrisaValues.hrisaDiabetesMellitius == true)
      return '1';
    else
      return '0';
  }

  String setSmk() {
    if (hrisaValues.hrisaSmoker == true)
      return '1';
    else
      return '0';
  }

  String setSbp() {
    double bp = double.parse(hrisaValues.hrisaBloodPressure);
    if (bp > 0 && bp < 140)
      return '120';
    else if (bp >= 140 && bp < 160)
      return '140';
    else if (bp >= 160 && bp < 180)
      return '160';
    else
      return '180';
  }

  String setCholestrol() {
    if (hrisaValues.hrisaCholestrolLevel == "") return '0';
    double chl = double.parse(hrisaValues.hrisaCholestrolLevel);
    if (chl > 0 && chl < 4.5)
      return '4';
    else if (chl >= 4.5 && chl < 5.5)
      return '5';
    else if (chl >= 5.5 && chl < 6.5)
      return '6';
    else if (chl >= 6.5 && chl < 7.5)
      return '7';
    else
      return '8';
  }

  @override
  void initState() {
    // TODO: implement initState
    if (hrisaValues.hrisaAge < 40) {
      hrisaRisk = '<10%';
      return;
    }
    refv = setAge() +
        setSex() +
        setDiabetes() +
        setSmk() +
        setSbp() +
        setCholestrol();
    //sleep(const Duration(milliseconds:600));
    print('refv : $refv');
    hrisaRisk = hrisaRiskValues[int.parse(refv)];
    super.initState();
  }

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
        body: ListView(
          children: <Widget>[
            Padding(
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
                    hrisaRisk ?? 'err',
                    style: kHrisaText.copyWith(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3.0,
                    ),
                  ),
                  SizedBox(height: 60.0),
                  BottomButton(
                    text: 'Recommendation',
                    onPressed: () {
                      hrisaValues.hrisaRisk = hrisaRisk;
                      hrisaValues.hrisaRecommendation =
                          advices[hrisaValues.hrisaRisk];
                      hrisaValues.printHrisaValues4();
                      Navigator.pushNamed(context, Recommendation.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
