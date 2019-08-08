import 'package:flutter/material.dart';
import 'package:hrisa/screens/login_page.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/consent_screen.dart';
import 'package:hrisa/screens/screening_screen.dart';
import 'package:hrisa/screens/medical_history_page.dart';
import 'package:hrisa/screens/who_ish_risk_page.dart';
import 'package:hrisa/screens/recommendation_page.dart';
import 'package:hrisa/utilities/constants.dart';

void main() => runApp(Hrisa());

class Hrisa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRISA',
      initialRoute: LoginPage.routeName,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
        ),
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        InputPage.routeName: (context) => InputPage(),
        UserConsent.routeName: (context) => UserConsent(),
        Screening.routeName: (context) => Screening(),
        MedicalHistory.routeName: (context) => MedicalHistory(),
        RiskScore.routeName: (context) => RiskScore(),
        Recommendation.routeName: (context) => Recommendation(),
      },
    );
  }
}
