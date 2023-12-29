import 'dart:io';

import 'package:colposcopy_report/test-multipage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_localizations/flutter_localizations.dart';
import '../Constants/Patient_example.dart';
import '../Constants/PDFForm_Strings.dart';
import '../Constants/Company_example.dart';
import '../Constants/Doctor_example.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru'), // English
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.create),
            onPressed: () {
              buildPdf2();

              // buildPdf(PdfPageFormat.a4).then((value) {
              // Printing.sharePdf(bytes: value, filename: 'Example.pdf');

              // });
            }),
        appBar: AppBar(
          title: const Center(
            child: Text('PDF Demo'),
          ),
        ),
        body: const Center(
          child: PDFViewer(),
        ),
      ),
    );
  }
}

// /// This method takes a page format and generates the Pdf file data
// Future<Uint8List> buildPdf() async {
//   // Future<Uint8List> buildPdf(PdfPageFormat format) async {
//   // Create the Pdf document

//   final pw.Document document = pw.Document(pageMode: PdfPageMode.outlines);

//   final font1 = await PdfGoogleFonts.openSansRegular();
//   final font2 = await PdfGoogleFonts.openSansBold();
//   final corplogoImage = pw.MemoryImage(
//     (await rootBundle.load('assets/logo_FE4867.png')).buffer.asUint8List(),
//   );
//   final Patient patient_example = Patient('Иван', 'Иванов', 'Иванович',
//       '01.01.2022', '01.01.2000', 'М', 'г.Москва', '8(999)999-99-99');
//   final Company company_example = Company(
//       'ООО "Компания"',
//       'г.Москва, ул. Ленина, 1',
//       'ООО "Компания" - это компания',
//       'a@a.a',
//       'www.компани.рф',
//       '8(999)999-99-99');

//   final Doctor doctor_example = Doctor('Иван', 'Иванов');
//   // Add one page with centered text "Hello World"

//   document.addPage(
//     pw.Page(
//       theme: pw.ThemeData.withFont(
//         base: font1,
//         bold: font2,
//       ),
//       // pageTheme: pw.PageTheme(
//       //   pageFormat: PdfPageFormat.standard,
//       // ),
//       pageFormat: PdfPageFormat.a4,
//       orientation: pw.PageOrientation.portrait,
//       build: (pw.Context context) {
//         return pw.Column(
//           // crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             // HEADER
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.start,
//               children: [
//                 pw.Container(
//                   alignment: pw.Alignment.center,
//                   // height: 35,
//                   constraints: const pw.BoxConstraints(
//                       minHeight: 35, maxHeight: 35, maxWidth: 60),
//                   child: pw.Image(corplogoImage),
//                 ),
//                 pw.SizedBox(width: 30),
//                 pw.Expanded(
//                   child: pw.Column(
//                     mainAxisAlignment: pw.MainAxisAlignment.start,
//                     crossAxisAlignment: pw.CrossAxisAlignment.center,
//                     children: [
//                       pw.Paragraph(
//                         text: company_example.name,
//                         textAlign: pw.TextAlign.justify,
//                         style: pw.TextStyle(font: font1, fontSize: 18),
//                       ),
//                       pw.Container(
//                         margin: const pw.EdgeInsets.fromLTRB(10, 0, 10, 10),
//                         child: pw.Text(
//                           company_example.description,
//                           style: pw.TextStyle(font: font1, fontSize: 10),
//                           maxLines: 4,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 pw.SizedBox(
//                   width: 100,
//                   child: pw.Column(
//                     mainAxisAlignment: pw.MainAxisAlignment.start,
//                     crossAxisAlignment: pw.CrossAxisAlignment.center,
//                     children: [
//                       pw.Text(
//                         company_example.email,
//                         textAlign: pw.TextAlign.justify,
//                         style: pw.TextStyle(font: font1, fontSize: 10),
//                       ),
//                       pw.SizedBox(height: 5),
//                       pw.Text(
//                         company_example.website +
//                             company_example.website +
//                             company_example.website,
//                         textAlign: pw.TextAlign.justify,
//                         style: pw.TextStyle(font: font1, fontSize: 10),
//                       ),
//                       pw.SizedBox(height: 5),
//                       pw.Text(
//                         company_example.phone,
//                         textAlign: pw.TextAlign.justify,
//                         style: pw.TextStyle(font: font1, fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // REPORT TITLE
//             pw.Center(
//               heightFactor: 2.5,
//               child: pw.Text(Strings.report_title,
//                   style: pw.Theme.of(context).header0),
//             ),
//             //PATIENT, EVENT DATE, DOCTOR
//             pw.Column(
//               children: [
//                 pw.Container(
//                   decoration: pw.BoxDecoration(
//                     border: pw.Border.symmetric(
//                       horizontal: pw.BorderSide(
//                         color: PdfColors.black.shade(0.5),
//                         width: 0.5,
//                       ),
//                     ),
//                   ),
//                   alignment: pw.Alignment.centerLeft,
//                   child: pw.Column(
//                     children: [
//                       pw.SizedBox(
//                         height: 5,
//                       ),
//                       pw.Row(
//                         children: [
//                           pw.Text(
//                               '${Strings.FiO}${patient_example.name} ${patient_example.patronymic} ${patient_example.surname} ',
//                               style: pw.Theme.of(context).header5),
//                         ],
//                       ),
//                       pw.SizedBox(
//                         height: 20,
//                       ),
//                       pw.Row(
//                         children: [
//                           pw.Text(
//                               Strings.day_of_examination +
//                                   patient_example.event_date,
//                               style: pw.Theme.of(context).header5),
//                           pw.SizedBox(
//                             width: 80,
//                           ),
//                           pw.Text(
//                             '${Strings.doctor} ${doctor_example.name} ${doctor_example.surname}',
//                             style: pw.Theme.of(context).header5,
//                             maxLines: 1,
//                           ),
//                         ],
//                       ),
//                       pw.SizedBox(
//                         height: 5,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             //REPORT CONTENT
//             // REPORT SECTIONS

//             // pw.Container(
//             //   height: 200,
//             //   color: PdfColors.red,
//             // ),
//             // pw.Container(
//             //   height: 200,
//             //   color: PdfColors.green,
//             // ),
//             // pw.Container(
//             //   height: 200,
//             //   color: PdfColors.red,
//             // ),

//             pw.Spacer(flex: 1),
//             //SIGNATURE
//             pw.Container(
//               alignment: pw.Alignment.centerRight,
//               child: pw.Text(Strings.signature,
//                   style: pw.Theme.of(context).header5),
//             ),
//           ],
//         );
//       },
//     ),
//     index: 0,
//   );
  
  
//   // document.addPage(
//   //   pw.Page(
//   //     theme: pw.ThemeData.withFont(
//   //       base: font1,
//   //       bold: font2,
//   //     ),
//   //     build: (pw.Context context) {
//   //       return pw.Container(color: PdfColors.amber);
//   //     },
//   //   ),
//   //   index: 1,
//   // );

  
//   //  var page = pw.Page(
//   //     theme: pw.ThemeData.withFont(
//   //       base: font1,
//   //       bold: font2,
//   //     ),
//   //     build: (pw.Context context) {
//   //       return pw.Container(color: PdfColors.amber);
//   //     },
//   //   );
    

//   document.save().then((value) {
//     File file = File('Example.pdf');
//     file.writeAsBytesSync(value);
//   });
//   // Build and return the final Pdf file data
//   // return await document.save();
//   return document.save();
// }

class PDFViewer extends StatelessWidget {
  const PDFViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (context) async => (await buildPdf2()),
      ),
    );
  }
}
