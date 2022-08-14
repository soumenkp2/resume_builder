import 'package:flutter/material.dart';
import 'package:resume_builder/PdfApi/pdf_resume_api.dart';
import 'package:resume_builder/Screens/main_screen.dart';

import '../PdfApi/pdf_api.dart';
import '../ResumeWidgets/achievement_Widget.dart';
import '../ResumeWidgets/education_Widget.dart';
import '../ResumeWidgets/experience_Widget.dart';
import '../ResumeWidgets/header_Widget.dart';
import '../ResumeWidgets/language_Widget.dart';
import '../ResumeWidgets/project_Widget.dart';
import '../ResumeWidgets/skill_Widget.dart';
import '../Screens/FormListPage.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Skills_Languages_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';

class Template_1 extends StatefulWidget {
  Type previousPage;
  List<Education_UserModel>? edu_list;
  List<Work_Projects_UserModel>? work_list;
  List<Work_Projects_UserModel>? project_list;
  List<Skills_Languages_UserModel>? skill_list;
  List<Achievements_UserModel>? achievement_list;
  List<Profile_UserModel>? profile_list;
  List<Skills_Languages_UserModel>? language_list;

  Template_1(
      this.previousPage,
      this.edu_list,
      this.work_list,
      this.project_list,
      this.profile_list,
      this.achievement_list,
      this.skill_list,
      this.language_list);

  @override
  State<StatefulWidget> createState() => Template_1state();
}

//const Resume_temp2_state ({ Key? key, this.serverIP }): super(key: key);

class Template_1state extends State<Template_1> {
  @override
  void initState() {
    super.initState();

    // widget.edu_list = new List<Education_UserModel>.empty(growable: true);
    // widget.work_list = new List<Work_Projects_UserModel>.empty(growable: true);
    // widget.project_list = new List<Work_Projects_UserModel>.empty(growable: true);
    // widget.skill_list = new List<Skills_Languages_UserModel>.empty(growable: true);
    // widget.achievement_list = new List<Achievements_UserModel>.empty(growable: true);
    // widget.profile_list = new List<Profile_UserModel>.empty(growable: true);
    // widget.language_list = new List<Skills_Languages_UserModel>.empty(growable: true);
    //
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
    // widget.language_list?.add(new Skills_Languages_UserModel());
    // widget.language_list?.elementAt(0).value = "Hindi";
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

  void _createPDF() async {
    final file = await pdfResumeApi.generate(
        widget.profile_list,
        widget.edu_list,
        widget.work_list,
        widget.project_list,
        widget.achievement_list,
        widget.skill_list,
        widget.language_list,
        "white",
        "black",
        "teal",
        1);
    PdfApi.openFile(file);
  }

  bool check_visibility(List<Education_UserModel> list) {
    bool check = true;

    list.forEach((value) {
      if (value.tableName == null ||
          value.organization_name == null ||
          value.qualification_name == null ||
          value.year_duration == null) {
        check = false;
      } else {
        check = true;
      }
    });

    return check;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => route()));
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
            height: 35,
          ),
          new header_Widget(
              height: 100,
              margin_top: 0,
              margin_left: 0,
              margin_bottom: 0,
              margin_right: 0,
              profile_list: widget.profile_list,
              color: "teal"),
          new Padding(
              padding: const EdgeInsets.all(10),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Flexible(
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Visibility(
                              child: new education_Widget(
                                  margin_top: 20,
                                  margin_left: 0,
                                  margin_bottom: 0,
                                  margin_right: 10,
                                  edu_list: widget.edu_list,
                                  color: "white",
                                  txt_color: "black",
                                  high_color: "teal"),
                              visible:
                                  check_visibility_education(widget.edu_list)),
                          Visibility(
                            child: new experience_Widget(
                                margin_top: 20,
                                margin_left: 0,
                                margin_bottom: 0,
                                margin_right: 10,
                                work_list: widget.work_list,
                                color: "white",
                                txt_color: "black",
                                high_color: "teal"),
                            visible:
                                check_visibility_work_project(widget.work_list),
                          ),
                          Visibility(
                              child: Language_Widget(
                                margin_top: 20,
                                margin_left: 0,
                                margin_bottom: 0,
                                margin_right: 10,
                                color: "white",
                                txt_color: "black",
                                high_color: "teal",
                                language_list: widget.language_list,
                              ),
                              visible: check_visibility_skills_lang(
                                  widget.language_list)),
                        ])),
                    new Flexible(
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Visibility(
                              child: new achievement_Widget(
                                  margin_top: 20,
                                  margin_left: 10,
                                  margin_bottom: 0,
                                  margin_right: 0,
                                  achievement_list: widget.achievement_list,
                                  color: "white",
                                  txt_color: "black",
                                  high_color: "teal"),
                              visible: check_visibility_achievement(
                                  widget.achievement_list)),
                          Visibility(
                            child: new project_Widget(
                              margin_left: 10,
                              margin_top: 20,
                              margin_bottom: 0,
                              margin_right: 0,
                              project_list: widget.project_list,
                              color: "white",
                              txt_color: "black",
                              high_color: "teal",
                            ),
                            visible: check_visibility_work_project(
                                widget.project_list),
                          ),
                          Visibility(
                              child: new skill_Widget(
                                  margin_left: 10,
                                  margin_top: 20,
                                  margin_bottom: 0,
                                  margin_right: 0,
                                  skill_list: widget.skill_list,
                                  color: "white",
                                  txt_color: "black",
                                  high_color: "teal"),
                              visible: check_visibility_skills_lang(
                                  widget.skill_list)),
                        ])),
                  ]))
        ])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.print),
          onPressed: _createPDF,
          //_printScreen ,
        ),
      ),
    );
  }

  Widget route() {
    if (widget.previousPage.toString() == 'your_resume_state')
      return main_screen(1);
    else
      return FormListPage(tableIndex: 1);
  }
}
