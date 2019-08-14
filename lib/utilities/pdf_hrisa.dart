import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

String pathToPdf = "";
void generatePdf() async {
  print('working');
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Know your Score',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Portable Document Format', textScaleFactor: 2),
                  PdfLogo()
                ])),
        Paragraph(
            text:
            'The Portable Document Format (PDF) is a file format developed by Adobe in the 1990s to present documents, including text formatting and images, in a manner independent of application software, hardware, and operating systems. Based on the PostScript language, each PDF file encapsulates a complete description of a fixed-layout flat document, including the text, fonts, vector graphics, raster images and other information needed to display it. PDF was standardized as an open format, ISO 32000, in 2008, and no longer requires any royalties for its implementation.'),
        Paragraph(
            text:
            'Today, PDF files may contain a variety of content besides flat text and graphics including logical structuring elements, interactive elements such as annotations and form-fields, layers, rich media (including video content) and three dimensional objects using U3D or PRC, and various other data formats. The PDF specification also provides for encryption and digital signatures, file attachments and metadata to enable workflows requiring these features.'),

        Table.fromTextArray(context: context, data: const <List<String>>[
          <String>['Date', 'PDF Version', 'Acrobat Version'],
          <String>['1993', 'PDF 1.0', 'Acrobat 1'],
          <String>['1994', 'PDF 1.1', 'Acrobat 2'],
          <String>['1996', 'PDF 1.2', 'Acrobat 3'],
          <String>['1999', 'PDF 1.3', 'Acrobat 4'],
          <String>['2001', 'PDF 1.4', 'Acrobat 5'],
          <String>['2003', 'PDF 1.5', 'Acrobat 6'],
          <String>['2005', 'PDF 1.6', 'Acrobat 7'],
          <String>['2006', 'PDF 1.7', 'Acrobat 8'],
          <String>['2008', 'PDF 1.7', 'Acrobat 9'],
          <String>['2009', 'PDF 1.7', 'Acrobat 9.1'],
          <String>['2010', 'PDF 1.7', 'Acrobat X'],
          <String>['2012', 'PDF 1.7', 'Acrobat XI'],
          <String>['2017', 'PDF 2.0', 'Acrobat DC'],
        ]),
        Padding(padding: const EdgeInsets.all(10)),
        Paragraph(
            text:
            'Text is available under the Creative Commons Attribution Share Alike License.')
      ]));

  final output = await getApplicationDocumentsDirectory();
  print(output.path);
  pathToPdf = '${output.path}example.pdf';
  final file = File(pathToPdf);
  await file.writeAsBytes(pdf.save());
}

