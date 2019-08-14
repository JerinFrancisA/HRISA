import 'package:sms/sms.dart';
import 'package:hrisa/screens/input_page.dart';

String address = hrisaValues.hrisaPhoneNumber;

Future<void> sendReport() async {
  print(hrisaValues.hrisaPhoneNumber);
  SmsSender sender = new SmsSender();
  String greeting = '';
  String recommendation = '';

  switch (hrisaValues.hrisaRisk) {
    case '<10%':
      greeting =
      'Greetings from HRI. In case of chest pain or symptoms of heartattack, call the Toll Free number 1800-123-1133. Your CVD risk score is <10% and we recommend :';
      recommendation =
          '\n1. Practice Healthy Diet, Life style & Exercise regularly';
      break;
    case '10% to <20%':
      greeting =
      'Greetings from HRI. In case of chest pain or symptoms of heartattack, call the Toll Free number 1800-123-1133. Your CVD risk score is 10% to <20% and we recommend:';
      recommendation =
          '1. Practice Healthy Diet, Life style & Exercise regularly';
      break;
    case '20% to <30%':
      greeting =
      'Greetings from HRI. In case of chest pain or symptoms of heartattack, call the Toll Free number 1800-123-1133. Your CVD risk score is 20% to <30% and we recommend:';
      recommendation =
          '1. Follow up with Physician regularly\n2. Continue medication (if taking any)';
      break;
    case '30% to <40%':
      greeting =
      'Greetings from HRI. In case of chest pain or symptoms of heartattack, call the Toll Free number 1800-123-1133. Your CVD risk score is 30% to <40% and we recommend:';
      recommendation =
          '1. Seek medical advice\n2. Follow up with Physician regularly\n3. Continue medication (if taking any)\n4. Practice Healthy Diet, Life style & Exercise regularly';
      break;
    case '>=40%':
      greeting =
      'Greetings from HRI. In case of chest pain or symptoms of heartattack, call the Toll Free number 1800-123-1133. Your CVD risk score is >=40% and we recommend :';
      recommendation =
          '1. Seek medical advice\n2. Follow up with Physician regularly\n3. Continue medication (if taking any)\n4. Practice Healthy Diet, Life style & Exercise regularly';
      break;
  }

  await sender.sendSms(new SmsMessage(address, greeting));
  await sender.sendSms(new SmsMessage(address, recommendation));
}

//and we recommend:\n$recommendation.\n
