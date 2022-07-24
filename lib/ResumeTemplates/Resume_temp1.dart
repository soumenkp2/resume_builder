import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/%20CustomResumeWidgets/Header_Widget.dart';
import 'package:resume_builder/ResumeTemplates/Template_6.dart';
import 'package:resume_builder/ResumeWidgets/project_Widget.dart';
import 'package:resume_builder/PdfApi/pdf_resume_api.dart';

import '../ CustomResumeWidgets/Language_Widget.dart';
import '../ CustomResumeWidgets/Skill_Widget.dart';
import '../ CustomResumeWidgets/Achievement_Widget.dart';
import '../ CustomResumeWidgets/Project_Widget.dart';
import '../ CustomResumeWidgets/Experience_Widget.dart';
import '../ CustomResumeWidgets/Education_Widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
//import 'package:pdf/widgets.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../PdfApi/pdf_api.dart';


class Resume_temp1 extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => Resume_temp1_state();
}

class Resume_temp1_state extends State<Resume_temp1>
{
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }

  // void _createPDF() async
  // {
  //   final file = await pdfResumeApi.generate();
  //   PdfApi.openFile(file);
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            new Header_Widget(
              height: 120,
              margin_top: 0,
              margin_left: 0,
              margin_bottom: 10,
              margin_right: 0,
              name: "Soumen Paul",
              phone: "8077570708",
              mail: "soumenkp2",
              link: "linkedin/soumenkp2",
              address: "Modinagar,India"

            ),

            new Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Flexible(
                          child: Education_Widget(
                              height: 360,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              course1_name: "Btech - Computer Science Engineering",
                              course2_name: "Secondary High School",
                              course3_name: "High School",
                              org1_name: "KIET Group of Institutions",
                              org2_name: "TRM Public School",
                              org3_name: "TRM Public School",
                              dur1_name: "2021-2024",
                              dur2_name: "2018-2019",
                              dur3_name: "2016-2017"
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: Project_Widget(
                              height: 360,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              project1_name: "Vidya Verse (Android App)",
                              project2_name: "Solar Guide (Android App)",
                              type1: "Group Project",
                              type2: "Group Project",
                              dur1_name: "2021-2022",
                              dur2_name: "2021-2022",
                              brief1: "Awarded 1st Runner up Prize in Nakshatra Hackosphere\nAn Edu tech based android app which acts as a platform to provide AR Based content",
                              brief2: "Awarded Global Nominee in NASA SPACE APPS 2021\nAn android app to guide users throught the way of opting solar and greener technology"
                          )
                      ),

                    ]
                )),

            new Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Flexible(
                          child: Experience_Widget(
                              height: 330,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              experience1_name: "Software Engineer Intern",
                              experience2_name: "Core, Android Mentor",
                              org1_name: "Spare8 Platforms Pvt. Ltd",
                              org2_name: "Innogeeks",
                              dur1_name: "Apr - Jul , 2022",
                              dur2_name: "Present",
                              brief1: "Worked on their Android part to improve their User Interface effeciency by 40-50%, Added Shimmers, porguard rules and also implemented Unit test cases",
                              brief2: "Currently managing club activities and mentoring more than 100+ students in various tech domains"
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: Achievement_Widget(
                              height: 330,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              course1_name: "Grand Finalist - Smart India Hackathon 2022",
                              course2_name: "National Winner - Execute 2.0",
                              course3_name: "National Finalist - HackFest'22",
                              org1_name: "Gov of India",
                              org2_name: "Ecell DTU",
                              org3_name: "IIT ISM Dhanabad",
                              course4_name: "1st Runner-up Nakshatra Hackathon",
                              course5_name: "Finalist Dot Slash 5.0",
                              org4_name: "Medi Caps University",
                            org5_name: "NIT Surat"
                          )
                      ),

                    ]
                )),

            new Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Flexible(
                          child: Skill_Widget(
                              height: 330,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              skill1: "Native Android Developement",
                            skill2: "Data Structures",
                            skill3: "Algorithms",
                            skill4: "Problem Solving",
                            skill5: "Operating Systems"
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: Language_Widget(
                              height: 330,
                              margin_top: 0,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              skill1: "English",
                              skill2: "Hindi",
                              skill3: "Bengali",

                          )
                      ),

                    ]
                )),





          ])) ,

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: //_createPDF
        _printScreen ,
    ),

    );
  }




}


