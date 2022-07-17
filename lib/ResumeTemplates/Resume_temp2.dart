import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/%20CustomResumeWidgets/Header_Widget.dart';

import '../ CustomResumeWidgets/Education_Widget.dart';
import '../ResumeWidgets/Language_Widget.dart';
import '../ResumeWidgets/skill_Widget.dart';
import '../ResumeWidgets/achievement_Widget.dart';
import '../ResumeWidgets/project_Widget.dart';
import '../ResumeWidgets/experience_Widget.dart';
import '../ResumeWidgets/education_Widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../ResumeWidgets/header_Widget.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Skills_Languages_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';






class Resume_temp2 extends StatefulWidget
{
  List<Education_UserModel>? edu_list;
  List<Work_Projects_UserModel>? work_list;
  List<Work_Projects_UserModel>? project_list;
  List<Skills_Languages_UserModel>? skill_list;
  List<Achievements_UserModel>? achievement_list;
  List<Profile_UserModel>? profile_list;

   Resume_temp2(this.edu_list, this.work_list, this.project_list, this.profile_list, this.achievement_list, this.skill_list);

  @override
  State<StatefulWidget> createState() => Resume_temp2_state();
}



//const Resume_temp2_state ({ Key? key, this.serverIP }): super(key: key);


class Resume_temp2_state extends State<Resume_temp2>
{


  @override
  void initState() {
    super.initState();
    // widget.edu_list = new List<Education_UserModel>.empty(growable: true);
    // widget.work_list = new List<Work_Projects_UserModel>.empty(growable: true);
    // widget.project_list = new List<Work_Projects_UserModel>.empty(growable: true);
    // widget.skill_list = new List<Skills_Languages_UserModel>.empty(growable: true);
    // widget.achievement_list = new List<Achievements_UserModel>.empty(growable: true);
    // widget.profile_list = new List<Profile_UserModel>.empty(growable: true);


    // widget.edu_list?.add(new Education_UserModel());
    // widget.edu_list?.elementAt(0).qualification_name = "BTech - Computer Science Engineering";
    // widget.edu_list?.elementAt(0).organization_name = "KIET Group of Institutions, Ghaziabad";
    // widget.edu_list?.elementAt(0).year_duration = "2020-2024";
    //
    // widget.edu_list?.add(new Education_UserModel());
    // widget.edu_list?.elementAt(1).qualification_name = "Secondary High School";
    // widget.edu_list?.elementAt(1).organization_name = "kiet 2";
    // widget.edu_list?.elementAt(1).year_duration = "BTECH CSE";
    //
    // widget.achievement_list?.add(new Achievements_UserModel());
    // widget.achievement_list?.elementAt(0).qualification_name = "Winner";
    // widget.achievement_list?.elementAt(0).organization_name = "Smart India Hackathon 2022";
    //
    // widget.achievement_list?.add(new Achievements_UserModel());
    // widget.achievement_list?.elementAt(1).qualification_name = "Winner";
    // widget.achievement_list?.elementAt(1).organization_name = "Smart India Hackathon 2022";
    //
    // widget.skill_list?.add(new Skills_Languages_UserModel());
    // widget.skill_list?.elementAt(0).value = "Native Android Dev";
    //
    // widget.work_list?.add(new Work_Projects_UserModel());
    // widget.work_list?.elementAt(0).qualification_name = "SWE";
    // widget.work_list?.elementAt(0).organization_name = "Spare8";
    // widget.work_list?.elementAt(0).brief = "Android";
    // widget.work_list?.elementAt(0).year_duration = "July";
    //
    // widget.work_list?.add(new Work_Projects_UserModel());
    // widget.work_list?.elementAt(1).qualification_name = "SWE";
    // widget.work_list?.elementAt(1).organization_name = "Spare8";
    // widget.work_list?.elementAt(1).brief = "Android";
    // widget.work_list?.elementAt(1).year_duration = "July";
    //
    // widget.project_list?.add(new Work_Projects_UserModel());
    // widget.project_list?.elementAt(0).qualification_name = "SWE";
    // widget.project_list?.elementAt(0).organization_name = "Spare8";
    // widget.project_list?.elementAt(0).brief = "Android";
    // widget.project_list?.elementAt(0).year_duration = "July";
    //
    // widget.project_list?.add(new Work_Projects_UserModel());
    // widget.project_list?.elementAt(1).qualification_name = "SWE";
    // widget.project_list?.elementAt(1).organization_name = "Spare8";
    // widget.project_list?.elementAt(1).brief = "Android";
    // widget.project_list?.elementAt(1).year_duration = "July";
    //
    // widget.profile_list?.add(new Profile_UserModel());
    // widget.profile_list?.elementAt(0).name = "Soumen Paul";
    // widget.profile_list?.elementAt(0).location = "Apna Modinagar";
    // widget.profile_list?.elementAt(0).social_link = "linkedin.com";
    // widget.profile_list?.elementAt(0).mail = "soumenkp2";
    // widget.profile_list?.elementAt(0).phone_no = "8077570708";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            new header_Widget(
                height: 120,
                margin_top: 0,
                margin_left: 0,
                margin_bottom: 10,
                margin_right: 0,
                profile_list: widget.profile_list,

            ),

            new Padding(padding: const EdgeInsets.all(10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  new Flexible(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          new education_Widget(
                            margin_top: 20,
                            margin_left: 0,
                            margin_bottom: 0,
                            margin_right: 10,
                            edu_list: widget.edu_list,
                          ),

                          new experience_Widget(
                            margin_top: 20,
                            margin_left: 0,
                            margin_bottom: 0,
                            margin_right: 10,
                            work_list: widget.work_list,
                          ),

                          new skill_Widget(
                  margin_left: 0,
                  margin_top: 20,
                  margin_bottom: 0,
                  margin_right: 10,
                  skill_list: widget.skill_list,
                  ),






                        ]

                  )),

                  new Flexible(
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[

                            new achievement_Widget(
                              margin_top: 20,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              achievement_list: widget.achievement_list,
                            ),

                            new project_Widget(
                              margin_left: 10,
                              margin_top: 20,
                              margin_bottom: 0,
                              margin_right: 0,
                              project_list: widget.project_list,
                            ),


                            Language_Widget(
                              height: 180,
                              margin_top: 20,
                              margin_left: 10,
                              margin_bottom: 0,
                              margin_right: 0,
                              skill1: "English",
                              skill2: "Hindi",
                              skill3: "Bengali",

                            )

                          ]

                      )),

                ]
              )

            )


          ]
        )
      )



    );
  }

}
