import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrisa/screens/input_page.dart';

Future<void> createHrisaPatientDocument() async {
  final _firestore = Firestore.instance;
  await _firestore.collection('Aveksha').add(
    {
      'Name': hrisaValues.hrisaName,
      'Dob': hrisaValues.hrisaDob,
      'Age': hrisaValues.hrisaAge,
      'Sex': hrisaValues.hrisaSex,
      'Address': hrisaValues.hrisaAddress,
      'Phone No.': hrisaValues.hrisaPhoneNumber,
      'Height': hrisaValues.hrisaHeight,
      'Weight': hrisaValues.hrisaWeight,
      'Bmi': hrisaValues.hrisaBmi,
      'Heart Rate': hrisaValues.hrisaHeartRate,
      'Blood Pressure': hrisaValues.hrisaBloodPressure,
      'Oxygen Saturation': hrisaValues.hrisaOxygenSaturation,
      'Cholestrol Level': hrisaValues.hrisaCholestrolLevel,
      'Waist Hip Ratio': hrisaValues.hrisaWaistHipRatio,
      'Diabetes Mellitius': hrisaValues.hrisaDiabetesMellitius,
      'Diabetes Mellitius Drugs': hrisaValues.hrisaDiabetesMellitiusDrugString,
      'Hypertension': hrisaValues.hrisaHypertension,
      'Hypertension Drugs': hrisaValues.hrisaHypertensionDrugString,
      'Smoker': hrisaValues.hrisaSmoker,
      'Other Conditions ': hrisaValues.hrisaOtherConditionsString == '1. '
          ? ''
          : hrisaValues.hrisaOtherConditionsString,
      'Risk': hrisaValues.hrisaRisk,
      'Recommendation': hrisaValues.hrisaRecommendation,
    },
  );
}