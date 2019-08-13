import 'dart:math';
import 'package:hrisa/utilities/twilio.dart';
import 'package:hrisa/screens/input_page.dart';

var key = 'ACd731d0d5aed21366a4e45b8a829e261e';
var authToken = '878ca3bd325cf23207cb163ae5763c9c';
var version = '2010-04-01';
//create a new twilio object
Twilio twilio = new Twilio(key, authToken, version);

var from = '+19384440586';
var to = hrisaValues.hrisaPhoneNumber;
var min = 100000;
var max = 999999;
var otp = (min + Random().nextInt(max - min)).toString();

//twilio.sendSMS(from, to, body).then((response) => print("Your message has been sent!")).catchError(print);

Future<void> sendOTP() async {
  try {
    await twilio.sendSMS(from, to, otp);
    print('Success !');
  } catch (e) {
    print(e);
  }
}
