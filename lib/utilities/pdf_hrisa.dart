import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart' as singleuse;
import 'package:hrisa/screens/login_page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hrisa/screens/input_page.dart';
import 'package:printing/printing.dart';

String pathToPdf = "";

String heartRateUnit() {
  if(hrisaValues.hrisaHeartRate != '') {
    return 'Heart Rate : ${hrisaValues.hrisaHeartRate} bpm';
  }
  return 'Heart Rate : ${hrisaValues.hrisaHeartRate}';
}

String spO2Unit() {
  if(hrisaValues.hrisaOxygenSaturation != '') {
    return 'SpO2 : ${hrisaValues.hrisaOxygenSaturation} %';
  }
  return 'SpO2 : ${hrisaValues.hrisaOxygenSaturation}';
}

void generatePdf() async {
  print('working');

  final Document pdf = Document();
  const imageProvider = const singleuse.AssetImage('images/hri.jpg');
  final PdfImage image = await pdfImageFromImageProvider(pdf: pdf.document, image: imageProvider);

  pdf.addPage(
    MultiPage(
      pageFormat:
      PdfPageFormat.a4.copyWith(marginLeft: 20.0, marginRight: 20.0, marginTop: 0.0, marginBottom: 15.0,),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image),
              Text(
                'Know your Score',
                style: TextStyle( font: Font.helveticaBold(),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
            ],
          ),
        );
      },
      build: (Context context) => <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name : ${hrisaValues.hrisaName}',
                  style: TextStyle( font: Font.helvetica(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Date : ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle( font: Font.helvetica(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              'Age : ${hrisaValues.hrisaAge}',
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.0),
            Text(
              'Sex : ${hrisaValues.hrisaSex}',
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Text(
              'Vital Parameters : ',
              style: TextStyle( font: Font.helveticaBold(),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              heartRateUnit(),
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.0),
            Text(
              'Blood Pressure : ${hrisaValues.hrisaBloodPressure}/${hrisaValues.hrisaDiastolicBloodPressure}',
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.0),
            Text(
              spO2Unit(),
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Height : ${hrisaValues.hrisaHeight} cm',
                  style: TextStyle( font: Font.helvetica(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Weight : ${hrisaValues.hrisaWeight} Kg',
                  style: TextStyle( font: Font.helvetica(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'BMI : ${hrisaValues.hrisaBmi}',
                  style: TextStyle( font: Font.helvetica(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'WHO /ISH Cardiovascular risk score : ${hrisaValues.hrisaRisk}',
              style: TextStyle( font: Font.helveticaBold(),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Text(
              'Recommendation(s) :',
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12.0),
            Text(
              '${hrisaValues.hrisaRecommendation}',
              style: TextStyle( font: Font.helvetica(),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                lineSpacing: 3.0,
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ],
      footer: (Context context) {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: Text(
            'In case of chest pain or symptoms of heart attack call Toll Free No: ${user.phoneNumber.replaceAll('+91', '')},\n For all other emergencies call 080 4050 3333',
            style: TextStyle(
              font: Font.timesItalic(),
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    ),
  );

  final output = await getApplicationDocumentsDirectory();
  print(output.path);
  pathToPdf = '${output.path}example.pdf';
  final file = File(pathToPdf);
  await file.writeAsBytes(pdf.save());

}