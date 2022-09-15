import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

class Template_2 extends StatefulWidget {
  Type previousPage;
  List<Education_UserModel>? edu_list;
  List<Work_Projects_UserModel>? work_list;
  List<Work_Projects_UserModel>? project_list;
  List<Skills_Languages_UserModel>? skill_list;
  List<Achievements_UserModel>? achievement_list;
  List<Profile_UserModel>? profile_list;
  List<Skills_Languages_UserModel>? language_list;

  Template_2(
      this.previousPage,
      this.edu_list,
      this.work_list,
      this.project_list,
      this.profile_list,
      this.achievement_list,
      this.skill_list,
      this.language_list);

  @override
  State<StatefulWidget> createState() => Template_2state();
}

//const Resume_temp2_state ({ Key? key, this.serverIP }): super(key: key);

class Template_2state extends State<Template_2> {

  late InterstitialAd _inter_ad;
  bool inter_Ad_loaded = false;

  void _init_ad()
  {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-4527142871746030/1752923309',
        //'ca-app-pub-4527142871746030/4974246345',
        //'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (error) {
            print("Intersitial ad failed to load $error");
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    _init_ad();
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
        "blueGrey",
        2);
    PdfApi.openFile(file);
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
              color: "blueGrey"),
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
                                  high_color: "blueGrey"),
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
                                  high_color: "blueGrey"),
                              visible: check_visibility_work_project(
                                  widget.work_list)),
                          Visibility(
                              child: Language_Widget(
                                margin_top: 20,
                                margin_left: 0,
                                margin_bottom: 0,
                                margin_right: 10,
                                color: "white",
                                txt_color: "black",
                                high_color: "blueGrey",
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
                                  high_color: "blueGrey"),
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
                                  high_color: "blueGrey"),
                              visible: check_visibility_work_project(
                                  widget.project_list)),
                          Visibility(
                              child: new skill_Widget(
                                  margin_left: 10,
                                  margin_top: 20,
                                  margin_bottom: 0,
                                  margin_right: 0,
                                  skill_list: widget.skill_list,
                                  color: "white",
                                  txt_color: "black",
                                  high_color: "blueGrey"),
                              visible: check_visibility_skills_lang(
                                  widget.skill_list)),
                        ])),
                  ]))
        ])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.file_open),
            onPressed: ()
            {
              if(inter_Ad_loaded)
              {
                _inter_ad.show();
                 inter_Ad_loaded = false;
              }
              else
              {
                print("Template - 2 , else");
                _createPDF();
              }

            }
          //_printScreen ,
        ),
      ),
    );
  }

  Widget route() {
    if (widget.previousPage.toString() == 'your_resume_state')
      return main_screen(1);
    else
      return FormListPage(tableIndex: 2);
  }

  onAdLoaded(InterstitialAd ad) {
    _inter_ad = ad;
    inter_Ad_loaded = true;
  }


}
