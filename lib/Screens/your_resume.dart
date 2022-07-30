import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/AppUtils/BoxImage.dart';
import 'package:resume_builder/AppUtils/CurvedWidget.dart';
import 'package:resume_builder/AppUtils/TextWidget.dart';
import 'package:resume_builder/main.dart';

import '../DataBase/DataBaseManager.dart';
import '../DataBase/TableName.dart';
import '../ResumeTemplates/Template_1.dart';
import '../ResumeTemplates/Template_2.dart';
import '../ResumeTemplates/Template_3.dart';
import '../ResumeTemplates/Template_4.dart';
import '../ResumeTemplates/Template_5.dart';
import '../ResumeTemplates/Template_6.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Skills_Languages_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';
import 'info_fillup.dart';

class your_resume extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => your_resume_state();
}

class your_resume_state extends State<your_resume> {
  List<TableName>? _tableName = [];
  List<Work_Projects_UserModel>? _workTable = [];
  List<Work_Projects_UserModel>? _projectTable = [];
  List<Skills_Languages_UserModel>? _skillTable = [];
  List<Skills_Languages_UserModel>? _languageTable = [];
  List<Profile_UserModel>? _profileTable = [];
  List<Achievements_UserModel>? _achievementTable = [];
  List<Education_UserModel>? _educationTable = [];
  late Future<List<TableName>?> list;

  _getTableName() async {
    final data = await DataBaseManager.instance.queryTableData();
    setState(() {
      _tableName = data;
    });

    return _tableName;
  }

  Future<void> _getDataBase(String tableName) async {
    final data = await DataBaseManager.instance.queryAchievementData(tableName);
    final data1 = await DataBaseManager.instance.queryEduData(tableName);
    final data2 = await DataBaseManager.instance.queryLanguageData(tableName);
    final data3 = await DataBaseManager.instance.queryProfileData(tableName);
    final data4 = await DataBaseManager.instance.queryProjectData(tableName);
    final data5 = await DataBaseManager.instance.querySkillsData(tableName);
    final data6 = await DataBaseManager.instance.queryWorkData(tableName);
    setState(() {
      _achievementTable = data;
      _educationTable = data1;
      _languageTable = data2;
      _profileTable = data3;
      _projectTable = data4;
      _skillTable = data5;
      _workTable = data6;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTableName();
    list = DataBaseManager.instance.queryTableData();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }

  void moveToResume(int index) {
    if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else if (index == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else if (index == 4) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else if (index == 6) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else if (index == 5) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigateResume(context, index)));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Container(
        color: Colors.white38,
        child: Container(
          child: Column(
            children: [
              Column(children: [
                CurvedWidget(
                  s: "Your Resume",
                  size: 25,
                  color: Color(0xFF011639),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                    new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text("View",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                        ]),

                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Your Previous Templates",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),

                    ),
                    ]),),)]),
              SizedBox(
                height: 400,
                child: FutureBuilder<List<TableName>?>(
                  builder: (ctx, snapshot) {
                    // Checking if future is resolved or not
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            '${snapshot.error} occurred',
                            style: TextStyle(fontSize: 18),
                          ),
                        );

                        // if we got our data
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await _getDataBase(
                                      _tableName?.elementAt(index!).tableName ??
                                          'Na');
                                  moveToResume(int.parse(
                                      _tableName?.elementAt(index!).id ?? '1'));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 340,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffd4e3ea),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: new Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Image.asset(
                                              'assets/images/template_${_tableName?.elementAt(index).id}.png',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          )),
                                    ),
                                    SizedBox(height: 10),
                                    TextWidget(text: _tableName?.elementAt(index!).tableName??'Na', size: 16, color: Color(0xFF000000)),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: list,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget navigateResume(BuildContext context, int index) {
    if (index == 1) {
      return Template_1(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else if (index == 2) {
      return Template_2(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else if (index == 3) {
      return Template_3(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else if (index == 4) {
      return Template_4(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else if (index == 6) {
      return Template_6(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else if (index == 5) {
      return Template_5(
          edu_list = _educationTable,
          work_list = _workTable,
          project_list = _projectTable,
          profile_list = _profileTable,
          achievement_list = _achievementTable,
          skill_list = _skillTable,
          language_list = _languageTable);
    } else {
      return Text("hello ji");
    }
  }
}
