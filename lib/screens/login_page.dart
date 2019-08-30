import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/custom_widgets/input_box.dart';
import 'package:hrisa/custom_widgets/bottom_button.dart';
import 'package:hrisa/custom_widgets/heading_text.dart';
import 'package:hrisa/utilities/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

final auth = FirebaseAuth.instance;
FirebaseUser user;

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

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
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: Form(
              autovalidate: true,
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        HeadingText(text: 'Log in with Hospital Id and password'),
                        hrisaEmail,
                        hrisaPassword,
                        BottomButton(
                          text: 'LOGIN',
                          onPressed: () async {
                            _submitForm();
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              user = await auth.signInWithEmailAndPassword(
                                email: hrisaEmail.input,
                                password: hrisaPassword.input,
                              );
                              if (user != null) {
                                setState(() {
                                  showSpinner = false;
                                });
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
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                Navigator.popAndPushNamed(context, InputPage.routeName);
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
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
