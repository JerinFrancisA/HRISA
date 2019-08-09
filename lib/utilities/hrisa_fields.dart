enum Sex { MALE, FEMALE, TRANSGENDER, NONE }

class Hrisa {

  void printHrisaValues1 () {
    print(hrisaName);
    print(hrisaDob);
    print(hrisaAge);
    print(hrisaSex);
    print(hrisaAddress);
  }
  void printHrisaValues2 () {
    print('\n\n\n');
    print(hrisaName);
    print(hrisaDob);
    print(hrisaAge);
    print(hrisaSex);
    print(hrisaAddress);
    print(hrisaPhoneNumber);
    print(hrisaHeight);
    print(hrisaWeight);
    print(hrisaBmi);
    print(hrisaHeartRate);
    print(hrisaBloodPressure);
    print(hrisaOxygenSaturation);
    print(hrisaCholestrolLevel);
    print(hrisaWaistHipRatio);
  }
  void printHrisaValues3 () {
    print('\n\n\n');
    print(hrisaName);
    print(hrisaDob);
    print(hrisaAge);
    print(hrisaSex);
    print(hrisaAddress);
    print(hrisaPhoneNumber);
    print(hrisaHeight);
    print(hrisaWeight);
    print(hrisaBmi);
    print(hrisaHeartRate);
    print(hrisaBloodPressure);
    print(hrisaOxygenSaturation);
    print(hrisaCholestrolLevel);
    print(hrisaWaistHipRatio);
    print(hrisaDiabetesMellitius);
    print(hrisaDiabetesMellitiusDrugString);
    print(hrisaHypertension);
    print(hrisaHypertensionDrugString);
    print(hrisaSmoker);
    print(hrisaOtherConditionsString);
  }

  //from input_page
  String hrisaName;
  String hrisaDob;
  int hrisaAge;
  String hrisaSex = Sex.NONE.toString();
  String hrisaAddress;
  String hrisaPhoneNumber;

  //from screening_page
  var hrisaHeight;
  var hrisaWeight;
  var hrisaBmi;
  var hrisaHeartRate;
  var hrisaBloodPressure;
  var hrisaOxygenSaturation;
  var hrisaCholestrolLevel;
  var hrisaWaistHipRatio;

  //from medical_history
  var hrisaDiabetesMellitius;
  String hrisaDiabetesMellitiusDrugString = '';
  var hrisaHypertension;
  String hrisaHypertensionDrugString = '';
  var hrisaSmoker;
  String hrisaOtherConditionsString = '';
}