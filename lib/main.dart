import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_localizations/flutter_localizations.dart';

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
              buildPdf();

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

/// This method takes a page format and generates the Pdf file data
Future<Uint8List> buildPdf() async {
  // Future<Uint8List> buildPdf(PdfPageFormat format) async {
  // Create the Pdf document

  final pw.Document document = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();

  // Add one page with centered text "Hello World"
  document.addPage(
    pw.Page(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(children: [
              pw.Container(
                alignment: pw.Alignment.center,
                height: 20,
                child: pw.Text('Место для картинки', style: pw.Theme.of(context).header1),
              ),
            ]),
            pw.Center(
              heightFactor: 2.5,
              child: pw.Text('Протокол кольпоскопии',
                  style: pw.Theme.of(context).header0),
            ),
            pw.Column(
              children: [
                pw.Container(
                  decoration: pw.BoxDecoration(
                    border: pw.Border.symmetric(
                      horizontal: pw.BorderSide(
                        color: PdfColors.black.shade(0.5),
                        width: 0.5,
                      ),
                    ),
                  ),
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text('ФИО: ', style: pw.Theme.of(context).header1),
                )
              ],
            ),
          ],
        );
      },
    ),
  );

  document.save().then((value) {
    File file = File('Example.pdf');
    file.writeAsBytesSync(value);
  });
  // Build and return the final Pdf file data
  // return await document.save();
  return document.save();
}

class PDFViewer extends StatelessWidget {
  const PDFViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (context) async => (await buildPdf()),
      ),
    );
  }
}
