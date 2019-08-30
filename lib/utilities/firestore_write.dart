import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:hrisa/screens/login_page.dart';

void removeCommaAndCountryCodeAndOtherStringComma() {
  hrisaValues.hrisaAddress = hrisaValues.hrisaAddress.replaceAll(',', ' ');
//  if (hrisaValues.hrisaPhoneNumber != '') {
//    hrisaValues.hrisaPhoneNumber = hrisaValues.hrisaPhoneNumber
//        .substring(3);
//  }
  hrisaValues.hrisaOtherConditionsString =
      hrisaValues.hrisaOtherConditionsString.replaceAll(',', '-');
  hrisaValues.hrisaDiabetesMellitiusDrugString =
      hrisaValues.hrisaDiabetesMellitiusDrugString.replaceAll(',', '-');
  hrisaValues.hrisaHypertensionDrugString =
      hrisaValues.hrisaHypertensionDrugString.replaceAll(',', '-');
}

void trueFalseToYesNo() {
  (hrisaValues.hrisaDiabetesMellitius == true)
      ? hrisaValues.hrisaDiabetesMellitius = 'Yes'
      : hrisaValues.hrisaDiabetesMellitius = 'No';
  (hrisaValues.hrisaHypertension == true)
      ? hrisaValues.hrisaHypertension = 'Yes'
      : hrisaValues.hrisaHypertension = 'No';
  (hrisaValues.hrisaSmoker == true)
      ? hrisaValues.hrisaSmoker = 'Yes'
      : hrisaValues.hrisaSmoker = 'No';
  (hrisaValues.hrisaAlcoholic == true)
      ? hrisaValues.hrisaAlcoholic = 'Yes'
      : hrisaValues.hrisaAlcoholic = 'No';
}

Future<void> createHrisaPatientDocument() async {
  final _firestore = Firestore.instance;
  removeCommaAndCountryCodeAndOtherStringComma();
  trueFalseToYesNo();

//  Firestore.instance.collection('products').getDocuments().then((myDocuments){
//    print("${myDocuments.documents.length}");
//  });

  await _firestore.collection(user.displayName).add(
    {
      'Dob': hrisaValues.hrisaDob,
      'Age': hrisaValues.hrisaAge,
      'Sex': hrisaValues.hrisaSex,
      'Address': hrisaValues.hrisaAddress,
      'Phone No.': hrisaValues.hrisaPhoneNumber,
      'Height': hrisaValues.hrisaHeight + ' cm',
      'Weight': hrisaValues.hrisaWeight + ' Kg',
      'Bmi': hrisaValues.hrisaBmi,
      'Heart Rate': hrisaValues.hrisaHeartRate,
      'Systolic Blood Pressure': hrisaValues.hrisaBloodPressure,
      'Diastolic Blood Pressure': hrisaValues.hrisaDiastolicBloodPressure,
      'Oxygen Saturation': hrisaValues.hrisaOxygenSaturation,
      'Cholestrol Level': hrisaValues.hrisaCholestrolLevel,
      'Waist Hip Ratio': hrisaValues.hrisaWaistHipRatio,
      'Diabetes Mellitius': hrisaValues.hrisaDiabetesMellitius,
      'Diabetes Mellitius Drugs': hrisaValues.hrisaDiabetesMellitiusDrugString,
      'Hypertension': hrisaValues.hrisaHypertension,
      'Hypertension Drugs': hrisaValues.hrisaHypertensionDrugString,
      'Smoker': hrisaValues.hrisaSmoker,
      'Alcoholic': hrisaValues.hrisaAlcoholic,
      'Other Conditions ': hrisaValues.hrisaOtherConditionsString == ' 1. ' ||
              hrisaValues.hrisaOtherConditionsString == '1. ' ||
              hrisaValues.hrisaOtherConditionsString == ' 1' ||
              hrisaValues.hrisaOtherConditionsString == '1' ||
              hrisaValues.hrisaOtherConditionsString == ' 1' ||
              hrisaValues.hrisaOtherConditionsString == '1 '
          ? ''
          : hrisaValues.hrisaOtherConditionsString,
      'Risk': hrisaValues.hrisaRisk,
      //'Recommendation': hrisaValues.hrisaRecommendation,
    },
  );
}
