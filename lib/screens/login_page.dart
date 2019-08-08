import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hospital Login',
            style: kHrisaText,
          ),
        ),
        body: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InputBox(
                  text: 'User ID / E-mail',
                  hintText: 'Enter E-mail',
                  keyBoardType: TextInputType.emailAddress,
                ),
                InputBox(
                  text: 'Password',
                  hintText: 'Enter Password',
                  obscureText: true,
                ),
                BottomButton(
                  text: 'LOGIN',
                  onPressed: () {
                    Navigator.pushNamed(context, InputPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
