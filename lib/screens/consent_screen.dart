import 'package:flutter/material.dart';
import 'package:hrisa/screens/consent_screen_two.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/custom_check_box.dart';
import 'package:hrisa/custom_widgets/sub_heading_text.dart';
import 'package:hrisa/screens/screening_screen.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:hrisa/utilities/sms_otp.dart';
import 'package:hrisa/screens/login_page.dart';

class UserConsent extends StatefulWidget {
  static const routeName = 'GiveConsent';

  @override
  _UserConsentState createState() => new _UserConsentState();
}

class _UserConsentState extends State<UserConsent> {
  String smsCode;
  String verificationId;
  String countryCode = '+91';

  Future<void> smsCodeDialog(BuildContext context) {
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
            maxLength: 4,
            decoration: InputDecoration.collapsed(hintText: null).copyWith(
              contentPadding: EdgeInsets.all(26.0),
              labelText: 'OTP',
              labelStyle: kHrisaText.copyWith(
                fontSize: 16.0,
                letterSpacing: 3.0,
                color: kLabelTextColor,
              ),
              hintText: 'XXXX',
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
                print(otp);
                print(smsCode);
                if (otp == smsCode) {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(CompleteConsent.routeName);
                } else {
                  Navigator.of(context).pop();
                  //signIn();
                }
              },
            )
          ],
        );
      },
    );
  }

  var hrisaPhoneNumber = InputBox(
    text: 'Phone',
    maxLength: 10,
    keyBoardType: TextInputType.number,
//    initialValue: '+91',
    hintText: 'Enter 10 digit Phone number',
    validator: (value) =>
        isValidPhoneNumber(value) ? null : 'Phone number must be 10 digits',
  );

  static bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
    return regex.hasMatch(input);
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
  }

  final _formKey = GlobalKey<FormState>();
  bool isAgreed = false;
  final _scrollController = ScrollController();
  bool _isOnTop = true;

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomCheckBox agreetoTermsAndConditions = CustomCheckBox(
      text: 'I agree',
      value: isAgreed,
      onChanged: (bool value) {
        setState(() {
          isAgreed = value;
        });
        setState(() {
          _isOnTop ? _scrollToBottom() : _scrollToTop();
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: kHrisaText,
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 26.0,
              right: 26.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.3),
                    offset: new Offset(10.0, 10.0),
                  )
                ],
              ),
              width: double.infinity,
              height: 400.0,
              child: Scrollbar(
                child: ListView(
                  children: <Widget>[
                    SubHeadingText(
                      text:
                          'INFORMED CONSENT- HEART RESCUE INDIA HELPDESK SCREENING',
                    ),
                    Text(
                      '\n1) This health screening is conducted to increase awareness and knowledge of cardiovascular diseases and adopting healthy lifestyle.',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                    Text(
                      '\n2) Health Screening will consist of measurement of height, weight, blood pressure, heart rate, oxygen saturation, waist and hip circumference. Relevant medical history like diabetes (high sugar), hypertension (high blood pressure) smoking and alcohol intake need to be provided. BMI (Body Mass Index), Waist hip ratio and WHO ISH cardiovascular disease risk score will be calculated. A report along with general recommendations will be provided as SMS or a hard copy as desired.',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                    Text(
                      '\n3) By participating in this health screening you are granting permission',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        '\n➜ To use the de-identified data for analysis of public health trends.',
                        style: kHrisaText.copyWith(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        '\n➜ To receive an SMS report and wellness notifications from the hospital to the registered phone number.',
                        style: kHrisaText.copyWith(fontSize: 14.0),
                      ),
                    ),
                    Text(
                      '\n4) Once you consent by clicking “I Agree” a One Time Password (OTP) will be sent to the registered phone number. Share the OTP with the health worker to proceed with screening.',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                    Text(
                      '\n5) A consent form needs to be signed if you do not have access to a mobile phone.',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                    Text(
                      '\n6) This is not a substitute for a physician consultation.',
                      style: kHrisaText.copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: agreetoTermsAndConditions,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Visibility(
              visible: !isAgreed,
              child: BottomButton(
                  text: 'CANCEL',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        InputPage.routeName,
                        ModalRoute.withName(LoginPage.routeName));
                  }),
            ),
          ),
          Visibility(
            visible: isAgreed,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  left: 26.0,
                  right: 26.0,
                  bottom: 26.0,
                ),
                child: Form(
                  autovalidate: true,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SubHeadingText(
                        text:
                            'Enter phone number to receive OTP. This number will be used to contact you further.',
                        style: kHrisaText.copyWith(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: kHeadingColor,
                        ),
                      ),
                      hrisaPhoneNumber,
                      BottomButton(
                        text: 'SEND OTP',
                        onPressed: () async {
                          _submitForm();
                          print(hrisaPhoneNumber.input);
                          hrisaValues.hrisaPhoneNumber =
                              countryCode + hrisaPhoneNumber.input;
                          sendOtp();
                          await smsCodeDialog(context);
                        },
                      ),
                      BottomButton(
                        text: 'WITHOUT OTP',
                        onPressed: () {
                          otp = '';
                          hrisaValues.hrisaPhoneNumber = '';
                          Navigator.of(context)
                              .pushReplacementNamed(Screening.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
