import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrisa/screens/consent_screen_two.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';

class UserConsent extends StatefulWidget {
  static const routeName = 'GiveConsent';

  @override
  _UserConsentState createState() => new _UserConsentState();
}

class _UserConsentState extends State<UserConsent> {
  //String phoneNo;
  String smsCode;
  String verificationId;

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Signed in');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: hrisaPhoneNumber.input,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Enter OTP received to ${hrisaPhoneNumber.input}',
              textAlign: TextAlign.center,
            ),
            titleTextStyle: kHrisaText.copyWith(
              fontSize: 14.0,
              color: kTextFormFieldTextColor,
            ),
            content: TextField(
              style: kHrisaText.copyWith(
                fontSize: 20.0,
                color: kTextFormFieldTextColor,
              ),
              maxLength: 6,
              decoration: InputDecoration.collapsed(hintText: null).copyWith(
                contentPadding: EdgeInsets.all(26.0),
                labelText: 'OTP',
                labelStyle: kHrisaText.copyWith(
                  fontSize: 16.0,
                  letterSpacing: 3.0,
                  color: kLabelTextColor,
                ),
                hintText: 'XXXXXX',
                hintStyle: kHrisaText.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 3.0,
                  color: kHintTextColor,
                ),
                filled: true,
                fillColor: kFieldBoxColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(6.0),
            backgroundColor: kScaffoldBackgroundColor,
            actions: <Widget>[
              RawMaterialButton(
                fillColor: kBottomButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'DONE',
                    style: kHrisaText.copyWith(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed(CompleteConsent.routeName);
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
      Navigator.of(context).pushReplacementNamed(CompleteConsent.routeName);
    }).catchError((e) {
      print(e);
    });
  }

  var hrisaPhoneNumber = InputBox(
    text: 'Phone',
    maxLength: 13,
    keyBoardType: TextInputType.number,
    initialValue: '+91',
    hintText: '(+91) Enter 10 digit Phone number',
    validator: (value) =>
        isValidPhoneNumber(value) ? null : 'Phone number must be 10 digits',
  );

  static bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\+\d\d\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: kHrisaText,
        ),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(25.0),
            child: Form(
              autovalidate: true,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  hrisaPhoneNumber,
                  BottomButton(
                    text: 'VERIFY',
                    onPressed: () {
                      _submitForm();
                      print(hrisaPhoneNumber.input);
                      verifyPhone();
                      hrisaValues.hrisaPhoneNumber = hrisaPhoneNumber.input;
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
