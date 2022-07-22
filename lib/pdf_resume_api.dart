import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:resume_builder/ResumeTemplates/Resume_temp3.dart';
import 'package:resume_builder/pdf_api.dart';

import ' CustomResumeWidgets/Language_Widget.dart';
import ' CustomResumeWidgets/Education_Widget.dart';
import ' CustomResumeWidgets/Header_Widget.dart';
import 'ResumeTemplates/Resume_temp1.dart';

class pdfResumeApi{

  static Future<File> generate() async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        resume_temp(),
      ],
    ));

    return PdfApi.saveDocument(name: 'my_resume.pdf', pdf: pdf);
  }

  static Widget resume_temp() => Column(
        children: [
          Text("So"),
        ],

  );
}