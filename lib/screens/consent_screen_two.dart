

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class CompleteConsent extends StatefulWidget {
  static const routeName = 'CompleteConsent';
  @override
  _CompleteConsentState createState() => _CompleteConsentState();
}

class _CompleteConsentState extends State<CompleteConsent> {
  String uid = '';

  getUid() {}

  @override
  void initState() {
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('OTP verified'),
                SizedBox(
                  height: 15.0,
                ),
                new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('PROCEED'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((action) {
                      Navigator
                          .of(context)
                          .pushReplacementNamed('/landingpage');
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}