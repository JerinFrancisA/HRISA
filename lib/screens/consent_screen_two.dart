import 'package:flutter/material.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/screens/screening_screen.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/utilities/send_otp.dart';

class CompleteConsent extends StatefulWidget {
  static const routeName = 'ConsentGiven';

  @override
  _CompleteConsentState createState() => _CompleteConsentState();
}

class _CompleteConsentState extends State<CompleteConsent> {
  String uid = '';

  getUid() {}

  @override
//  void initState() {
//    this.uid = '';
//    FirebaseAuth.instance.currentUser().then((val) {
//      setState(() {
//        print(val.uid);
//        this.uid = val.uid;
//      });
//    }).catchError((e) {
//      print(e);
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consent Given',
          style: kHrisaText,
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('OTP verified', style: kHrisaText),
              SizedBox(
                height: 15.0,
              ),
              BottomButton(
                text: 'PROCEED',
                onPressed: () {
                  otp = '';
                  Navigator.of(context)
                      .pushReplacementNamed(Screening.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
