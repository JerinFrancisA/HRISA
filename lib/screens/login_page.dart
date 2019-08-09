import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/utilities/constants.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save(); //This invokes each onSaved event
  }

  var hrisaEmail = InputBox(
    text: 'User ID',
    hintText: 'Enter E-mail',
    keyBoardType: TextInputType.emailAddress,
  );
  var hrisaPassword = InputBox(
    text: 'Password',
    hintText: 'Enter Password',
    obscureText: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            autovalidate: true,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  hrisaEmail,
                  hrisaPassword,
                  BottomButton(
                    text: 'LOGIN',
                    onPressed: () async {
                      _submitForm();
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                          email: hrisaEmail.input,
                          password: hrisaPassword.input,
                        );
                        if (user != null) {
                          await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: kScaffoldBackgroundColor,
                                title: Text(
                                  'Logged in Successfully !!',
                                  textAlign: TextAlign.center,
                                  style: kHrisaText.copyWith(
                                    color: kTextFormFieldTextColor,
                                  ),
                                ),
                                actions: <Widget>[
                                  RawMaterialButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'CONTINUE',
                                        style: kHrisaText.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    fillColor: kBottomButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          Navigator.pushNamed(context, InputPage.routeName);
                        }
                      } catch (e) {
                        print(e);
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: kScaffoldBackgroundColor,
                              title: Text(
                                'Wrong Email/ Password',
                                textAlign: TextAlign.center,
                                style: kHrisaText.copyWith(
                                  color: kTextFormFieldTextColor,
                                ),
                              ),
                              actions: <Widget>[
                                RawMaterialButton(
                                  child: Text(
                                    'RETRY',
                                    style: kHrisaText.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  fillColor: kBottomButtonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
