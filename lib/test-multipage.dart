import 'dart:io';
import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
// import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../Constants/Patient_example.dart';
import '../Constants/PDFForm_Strings.dart';
import '../Constants/Company_example.dart';
import '../Constants/Doctor_example.dart';

Future<Uint8List> buildPdf2() async {
  final Document doc = Document(pageMode: PdfPageMode.outlines);

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final corplogoImage = MemoryImage(
    (await rootBundle.load('assets/logo_FE4867.png')).buffer.asUint8List(),
  );
  final Patient patient_example = Patient('Иван', 'Иванов', 'Иванович',
      '01.01.2022', '01.01.2000', 'М', 'г.Москва', '8(999)999-99-99');
  final Company company_example = Company(
      'ООО "Компания"',
      'г.Москва, ул. Ленина, 1',
      'ООО "Компания" - это компания',        
      'a@a.a',
      'www.компани.рф',
      '8(999)999-99-99');

  final Doctor doctor_example = Doctor('Иван', 'Иванов');

  // document.addPage(MultiPage(
  //   pageTheme: PageTheme(
  //     pageFormat: PdfPageFormat.a4,
  //     orientation: PageOrientation.portrait,
  //     margin: EdgeInsets.all(0),
  //     theme: ThemeData.withFont(
  //       base: font1,
  //       bold: font2,
  //     ),
  //   ),
  //   build: (Context context) {
  //     return <Widget>[
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.symmetric(
  //             horizontal: BorderSide(
  //               color: PdfColors.black.shade(0.5),
  //               width: 0.5,
  //             ),
  //           ),
  //         ),
  //         alignment: Alignment.centerLeft,
  //         child: Image(corplogoImage),
  //       ),
  //       SizedBox(width: 30),
  //       Expanded(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Paragraph(
  //               text: company_example.name,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 18),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
  //               decoration: BoxDecoration(
  //                 border: Border.symmetric(
  //                   horizontal: BorderSide(
  //                     color: PdfColors.black.shade(0.5),
  //                     width: 0.5,
  //                   ),
  //                 ),
  //               ),
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 company_example.email,
  //                 textAlign: TextAlign.justify,
  //                 style: TextStyle(font: font1, fontSize: 10),
  //               ),
  //             ),
  //             SizedBox(height: 5),
  //             Text(
  //               company_example.website,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 10),
  //             ),
  //             SizedBox(height: 5),
  //             Text(
  //               company_example.phone,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 10),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         width: 100,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               company_example.email,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 10),
  //             ),
  //             SizedBox(height: 5),
  //             Text(
  //               company_example.website,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 10),
  //             ),
  //             SizedBox(height: 5),
  //             Text(
  //               company_example.phone,
  //               textAlign: TextAlign.justify,
  //               style: TextStyle(font: font1, fontSize: 10),
  //             ),
  //           ],
  //         ),
  //       ),

  //     ];
  //   },
  // ));
  // return await document.save();
  doc.addPage(
    MultiPage(
      theme: ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return SizedBox();
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: PdfColors.grey))),
            child: Text('${company_example.name}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      // footer: (Context context) {
      //   return Container(
      //       alignment: Alignment.centerRight,
      //       margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
      //       child: Text(
      //           'Страница ${context.pageNumber} из ${context.pagesCount}',
      //           style: Theme.of(context)
      //               .defaultTextStyle
      //               .copyWith(color: PdfColors.grey)));
      // },
      build: (Context context) => <Widget>[
        Header(
          level: 0,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                // height: 35,
                constraints: const BoxConstraints(
                    minHeight: 35, maxHeight: 35, maxWidth: 60),
                child: Image(corplogoImage),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Paragraph(
                      text: company_example.name,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).header5,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        company_example.description,
                        maxLines: 4,
                        style: TextStyle(font: font1, fontSize: 10),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        company_example.email,
                        textAlign: TextAlign.justify,
                        style: TextStyle(font: font1, fontSize: 10),
                      ),
                      SizedBox(height: 5),
                      Text(
                        company_example.website,
                        textAlign: TextAlign.justify,
                        style: TextStyle(font: font1, fontSize: 10),
                      ),
                      SizedBox(height: 5),
                      Text(
                        company_example.phone,
                        textAlign: TextAlign.justify,
                        style: TextStyle(font: font1, fontSize: 10),
                      ),
                    ],
                  ))
            ],
          ),
        ),

        SizedBox(height: 10),
        Header(
          level: 1,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Paragraph(
                      text:
                          '${Strings.FiO} ${patient_example.name} ${patient_example.patronymic} ${patient_example.surname}',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '${Strings.day_of_examination} ${patient_example.event_date}',
                        ),
                        Spacer(),
                        Text(
                          '${Strings.doctor} ${doctor_example.name} ${doctor_example.surname}',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        
        Spacer(),
        Container(
          alignment: Alignment.centerRight,
          child: Text(Strings.signature, style: Theme.of(context).header5),
        ),
        
        //REPORT CONTENT
        // REPORT SECTIONS
      ],
    ),
  );
  doc.save().then((value) {
    File file = File('Example.pdf');
    file.writeAsBytesSync(value);
  });
  return await doc.save();
}




        // Container(
        //   color: PdfColors.grey200,
        //   height: 300,
        //   alignment: Alignment.centerRight,
        //   child: Text(Strings.signature, style: Theme.of(context).header5),
        // ),
        // Container(
        //   color: PdfColors.green200,
        //   height: 300,
        //   alignment: Alignment.centerRight,
        //   child: Text('Eeeeeeeeeeeeeeeeeeeeeeeeeeee'),
        // ),
        // Container(
        //   color: PdfColors.grey200,
        //   height: 300,
        //   alignment: Alignment.centerRight,
        //   child: Text(Strings.signature, style: Theme.of(context).header5),
        // ),