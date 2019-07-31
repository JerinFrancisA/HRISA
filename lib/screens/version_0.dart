


//import 'package:flutter/material.dart';
//
//class InputPage extends StatefulWidget {
//  @override
//  _InputPageState createState() => _InputPageState();
//}
//
//class _InputPageState extends State<InputPage> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Center(child: Text('Patient Info')),
//        ),
//        body: Column(
//          children: <Widget>[
//            PatientInfoBox(text: 'NAME'),
//            PatientInfoBox(
//              text: 'DOB',
//              keyb: TextInputType.number,
//            ),
//            PatientInfoBox(text: 'SEX'),
//            PatientInfoBox(
//              text: 'ADDRESS',
//              maxLines: 3,
//            ),
//            PatientInfoBox(
//              text: 'PHONE',
//              maxLength: 10,
//              keyb: TextInputType.number,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class PatientInfoBox extends StatelessWidget {
//  final text;
//  final maxLength;
//  final maxLines;
//  final keyb;
//
//  PatientInfoBox(
//      {@required this.text, this.maxLength, this.keyb = TextInputType.text, this.maxLines});
//
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: Card(
//        child: Form(
//          child: TextFormField(
//            keyboardType: keyb,
//            maxLength: maxLength,
//            maxLines: maxLines,
//            decoration: InputDecoration(
//              labelText: text,
//              labelStyle: TextStyle(
//                fontSize: 10.0,
//                fontWeight: FontWeight.w400,
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
