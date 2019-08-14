import 'package:sms/sms.dart';
import 'package:hrisa/screens/input_page.dart';
import 'dart:math';

var otp = '';

Future<void> sendOtp() async {
  SmsSender sender = new SmsSender();
  String address = hrisaValues.hrisaPhoneNumber;
  var min = 1000;
  var max = 9999;
  otp = (min + Random().nextInt(max - min)).toString();
  sender.sendSms(new SmsMessage(address, otp));
}