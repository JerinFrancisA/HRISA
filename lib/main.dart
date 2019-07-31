import 'package:flutter/material.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/consent_screen.dart';
import 'package:hrisa/screens/screening_screen.dart';
import 'package:hrisa/utilities/constants.dart';

void main() => runApp(Hrisa());

class Hrisa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRISA',
      initialRoute: '/',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
        ),
      ),
      routes: {
        '/': (context) => InputPage(),
        'UserConsent': (context) => UserConsent(),
        'Screening': (context) => Screening(),
      },
    );
  }
}
