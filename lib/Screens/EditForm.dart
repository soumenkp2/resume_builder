import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/DataBase/TableName.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:resume_builder/UserModels/Skills_Languages_UserModel.dart';

import '../DataBase/DataBaseManager.dart';

import '../ResumeTemplates/Template_1.dart';
import '../ResumeTemplates/Template_2.dart';
import '../ResumeTemplates/Template_3.dart';
import '../ResumeTemplates/Template_4.dart';
import '../ResumeTemplates/Template_5.dart';
import '../ResumeTemplates/Template_6.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';

class editForm extends StatefulWidget {
  List<Education_UserModel>? edu_list1;
  List<Work_Projects_UserModel>? work_list11;
  List<Work_Projects_UserModel>? project_list11;
  List<Skills_Languages_UserModel>? skill_list11;
  List<Achievements_UserModel>? achievement_list11;
  List<Profile_UserModel>? profile_list11;
  List<Skills_Languages_UserModel>? language_list11;
  String? form_name11;

  int index;

  editForm(
      this.edu_list1,
      this.work_list11,
      this.project_list11,
      this.skill_list11,
      this.achievement_list11,
      this.profile_list11,
      this.language_list11,
      this.form_name11,
      this.index);

  @override
  State<StatefulWidget> createState() => editForm_state();
}

List<Education_UserModel>? edu_list1;
List<Work_Projects_UserModel>? work_list1;
List<Work_Projects_UserModel>? project_list1;
List<Skills_Languages_UserModel>? skill_list1;
List<Achievements_UserModel>? achievement_list1;
List<Profile_UserModel>? profile_list1;
List<Skills_Languages_UserModel>? language_list1;
String? form_name1;

Map<String, List>? final_data;
bool? send_flag;
Map<String, bool>? categories;
String? category_head_name;

class editForm_state extends State<editForm> {
  @override
  void initState() {
    super.initState();
    edu_list1 = widget.edu_list1;
    work_list1 = widget.work_list11;
    project_list1 = widget.project_list11;
    skill_list1 = widget.skill_list11;
    achievement_list1 = widget.achievement_list11;
    profile_list1 = widget.profile_list11;
    language_list1 = widget.language_list11;

    categories = new Map<String, bool>();
    categories!["Education"] = true;
    categories!["Achievements"] = false;
    categories!["Skills"] = false;
    categories!["Projects"] = false;
    categories!["Work"] = false;
    categories!["Profile"] = false;
    categories!["Languages"] = false;

    category_head_name = "Education";

    // edu_list1?.add(new Education_UserModel());
    // achievement_list1?.add(new Achievements_UserModel());
    // work_list1?.add(new Work_Projects_UserModel());
    // project_list1?.add(new Work_Projects_UserModel());
    // skill_list1?.add(new Skills_Languages_UserModel());
    // profile_list1?.add(new Profile_UserModel());
    // language_list1?.add(new Skills_Languages_UserModel());
  }

  void add_card(String category_name) {
    setState(() {
      if (category_name == "Education") {
        if (edu_list1!.length > 1) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          edu_list1?.add(new Education_UserModel());
        }
      } else if (category_name == "Achievements") {
        if (achievement_list1!.length > 1) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          achievement_list1?.add(new Achievements_UserModel());
        }
      } else if (category_name == "Work") {
        if (work_list1!.length > 1) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          work_list1?.add(new Work_Projects_UserModel());
        }
      } else if (category_name == "Projects") {
        if (project_list1!.length > 1) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          project_list1?.add(new Work_Projects_UserModel());
        }
      } else if (category_name == "Skills") {
        if (skill_list1!.length > 1) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          skill_list1?.add(new Skills_Languages_UserModel());
        }
      } else if (category_name == "Profile") {
        if (profile_list1!.length >= 0) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          profile_list1?.add(new Profile_UserModel());
        }
      } else if (category_name == "Languages") {
        if (language_list1!.length > 4) {
          var snackBar = SnackBar(content: Text('Max Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          language_list1?.add(new Skills_Languages_UserModel());
        }
      } else {
        var snackBar = SnackBar(content: Text('Unwanted Behaviour Noticed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void delete_card(String category_name) {
    setState(() {
      if (category_name == "Education") {
        if (edu_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          edu_list1?.removeLast();
        }
      } else if (category_name == "Achievements") {
        if (achievement_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          achievement_list1?.removeLast();
        }
      } else if (category_name == "Work") {
        if (work_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          work_list1?.removeLast();
        }
      } else if (category_name == "Projects") {
        if (project_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          project_list1?.removeLast();
        }
      } else if (category_name == "Skills") {
        if (skill_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          skill_list1?.removeLast();
        }
      } else if (category_name == "Profile") {
        if (profile_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          profile_list1?.removeLast();
        }
      } else if (category_name == "Languages") {
        if (language_list1!.length <= 1) {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          language_list1?.removeLast();
        }
      } else {
        var snackBar = SnackBar(content: Text('Unwanted Behaviour Noticed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void category_observation(String category_name) {
    setState(() {
      categories?.forEach((key, value) {
        if (key == category_name) {
          category_head_name = category_name;
          categories![key] = true;
        } else {
          categories![key] = false;
        }
      });

      print("\n\nProfile");
      profile_list1?.forEach((element) {
        print(element.name);
        print(element.phone_no);
        print(element.mail);
        print(element.location);
        print(element.social_link);
      });

      print("\n\nEducation");
      edu_list1?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
      });

      print("\n\nProjects");
      project_list1?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
        print(element.brief);
      });

      print("\n\nWork");
      work_list1?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
        print(element.brief);
      });

      print("\n\nAchievements");
      achievement_list1?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
      });

      print("\n\nSkills");
      skill_list1?.forEach((element) {
        print(element.value);
      });

      print("\n\nLanguages");
      language_list1?.forEach((element) {
        print(element.value);
      });
    });

    print(form_name1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new SingleChildScrollView(
          child: new Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: new SizedBox(
                height: 60,
                child: new ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(5),
                    children: <Widget>[
                      new InkWell(
                          onTap: () {
                            category_observation("Education");
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.teal, spreadRadius: 2),
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: new Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: new Image.asset(
                                    'assets/images/education.png',
                                    //height: 15.0,
                                    fit: BoxFit.cover,
                                  )))),
                      new InkWell(
                        onTap: () {
                          category_observation("Skills");
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                              padding: const EdgeInsets.all(10),
                              child: new Image.asset(
                                'assets/images/skill.png',
                                //height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      new InkWell(
                        onTap: () {
                          category_observation("Achievements");
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                                padding: const EdgeInsets.all(10),
                                child: new Image.asset(
                                  'assets/images/trophy.png',
                                  // height: 35.0,
                                  // fit: BoxFit.cover,
                                ))),
                      ),
                      new InkWell(
                        onTap: () {
                          category_observation("Work");
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                              padding: const EdgeInsets.all(10),
                              child: new Image.asset(
                                'assets/images/work_experience.png',
                                //height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      new InkWell(
                        onTap: () {
                          category_observation("Profile");
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                              padding: const EdgeInsets.all(10),
                              child: new Image.asset(
                                'assets/images/profile.png',
                                //height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      new InkWell(
                        onTap: () {
                          category_observation("Projects");
                        },
                        child: new Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                              padding: const EdgeInsets.all(10),
                              child: new Image.asset(
                                'assets/images/projects.png',
                                //height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      new InkWell(
                        onTap: () {
                          category_observation("Languages");
                        },
                        child: new Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.teal, spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new Padding(
                              padding: const EdgeInsets.all(10),
                              child: new Image.asset(
                                'assets/images/projects.png',
                                //height: 15.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ]),
              )),
        ),
        //Termination of Categories

        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            initialValue: form_name1,
            onChanged: (text) => form_name1 = text,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Can\'t be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Form Name',
            ),
          ),
        ),

        new Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 80, 0),
                child: new Text(category_head_name!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
              ),
              new InkWell(
                onTap: () {
                  add_card(category_head_name!);
                },
                child: new Padding(
                    padding: const EdgeInsets.all(10),
                    child: new Image.asset(
                      'assets/images/addbtn.png',
                      height: 35.0,
                      // fit: BoxFit.cover,
                    )),
              ),
              new InkWell(
                onTap: () {
                  delete_card(category_head_name!);
                },
                child: new Visibility(
                  visible: true,
                  child: new Padding(
                      padding: const EdgeInsets.all(10),
                      child: new Image.asset(
                        'assets/images/minusbtn.png',
                        height: 35.0,
                        // fit: BoxFit.cover,
                      )),
                ),
              )
            ])),

        new Divider(
          color: Colors.black,
          thickness: 3,
        ),

        new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(children: <Widget>[
                      current_category(index),
                    ]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: list_len())
            ]),

        new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        //Resume_temp2()));
                        Next_to_dynamic_resume(context, widget.index)));
                //Resume_temp2(edu_list1, work_list1, project_list1, profile_list1, achievement_list1, skill_list1, language_list1)));
                //edu_data_upload(context);
              },
              child: Text('Next',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            )),
      ],
    )));
  }
}

Widget Next_to_dynamic_resume(BuildContext context, int index) {
  bool check = true;

  edu_list1?.forEach((value) {
    if (value.tableName == null ||
        value.organization_name == null ||
        value.qualification_name == null ||
        value.year_duration == null) {
      check = false;
    }
  });

  project_list1?.forEach((value) {
    if (value.tableName == null ||
        value.organization_name == null ||
        value.qualification_name == null ||
        value.year_duration == null ||
        value.brief == null) {
      check = false;
    }
  });

  work_list1?.forEach((value) {
    if (value.tableName == null ||
        value.organization_name == null ||
        value.qualification_name == null ||
        value.year_duration == null ||
        value.brief == null) {
      check = false;
    }
  });

  achievement_list1?.forEach((value) {
    if (value.tableName == null ||
        value.organization_name == null ||
        value.qualification_name == null) {
      check = false;
    }
  });

  profile_list1?.forEach((value) {
    if (value.tableName == null ||
        value.name == null ||
        value.location == null ||
        value.phone_no == null) {
      check = false;
    }
  });

  skill_list1?.forEach((value) {
    if (value.tableName == null || value.value == null) {
      check = false;
    }
  });

  language_list1?.forEach((value) {
    if (value.tableName == null || value.value == null) {
      check = false;
    }
  });

  if (form_name1 == null) {
    check = false;
  }

  if (check == true) {
    insertDataBase1();
    if (index == 1) {
      return Template_1(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup()));
    } else if (index == 2) {
      return Template_2(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup()));
    } else if (index == 3) {
      return Template_3(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>info_fillup()));
    } else if (index == 4) {
      return Template_4(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup()));
    } else if (index == 6) {
      return Template_6(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup()));
    } else if (index == 5) {
      return Template_5(edu_list1, work_list1, project_list1, profile_list1,
          achievement_list1, skill_list1, language_list1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup()));
    } else {
      return Text("hello ji");
    }

    //return Resume_temp2(edu_list1, work_list1, project_list1, profile_list1, achievement_list1, skill_list1, language_list1);
  } else {
    return new Text("Fill all the blanks properly!!",
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
  }
}

void insertDataBase1() {
  var db = DataBaseManager.instance;
  skill_list1?.forEach((element) {
    db.insertKeys("SKILLS", element);
  });
  edu_list1?.forEach((element) {
    db.insertKeys("EDUCATION", element);
  });
  work_list1?.forEach((element) {
    db.insertKeys("WORK", element);
  });
  project_list1?.forEach((element) {
    db.insertKeys("PROJECT", element);
  });
  profile_list1?.forEach((element) {
    db.insertKeys("PROFILE", element);
  });
  language_list1?.forEach((element) {
    db.insertKeys("LANGUAGE", element);
  });
  achievement_list1?.forEach((element) {
    db.insertKeys("ACHIEVEMENT", element);
  });
  TableName t = new TableName(tableName: form_name1);
  db.insertKeys("TABLENAME", t);
}

int list_len() {
  if (categories!["Education"] == true) {
    return edu_list1!.length;
  } else if (categories!["Achievements"] == true) {
    return achievement_list1!.length;
  } else if (categories!["Profile"] == true) {
    return profile_list1!.length;
  } else if (categories!["Work"] == true) {
    return work_list1!.length;
  } else if (categories!["Projects"] == true) {
    return project_list1!.length;
  } else if (categories!["Skills"] == true) {
    return skill_list1!.length;
  } else if (categories!["Languages"] == true) {
    return language_list1!.length;
  } else {
    return 0;
  }
}

Widget current_category(int index) {
  if (categories!["Education"] == true) {
    return Education_fillup_widget(index: index);
  } else if (categories!["Achievements"] == true) {
    return Achievement_fillup_widget(index: index);
  } else if (categories!["Profile"] == true) {
    return Profile_fillup_widget(
      index: index,
    );
  } else if (categories!["Work"] == true) {
    return Work_fillup_widget(index: index);
  } else if (categories!["Projects"] == true) {
    return Project_fillup_widget(index: index);
  } else if (categories!["Skills"] == true) {
    return Skill_fillup_widget(index: index);
  } else if (categories!["Languages"] == true) {
    return language_fillup_widget(index: index);
  } else {
    return Text("Invalid Widget");
  }
}

class Profile_fillup_widget extends StatelessWidget {
  int? index;
  String? name;
  String? phone_no;
  String? location;
  String? link;
  String? mail;

  Profile_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list1?.elementAt(index!).name,
                    onChanged: (text) => name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your name',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list1?.elementAt(index!).phone_no,
                    onChanged: (text) => phone_no = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter phone no',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list1?.elementAt(index!).location,
                    onChanged: (text) => location = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter address',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list1?.elementAt(index!).mail,
                    onChanged: (text) => mail = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter mail id',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list1?.elementAt(index!).social_link,
                    onChanged: (text) => link = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter social media link',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        profile_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void profile_data_upload(BuildContext context) {
    if (name == null) {
      name = profile_list1?.elementAt(index!).name;
    }
    if (location == null) {
      location = profile_list1?.elementAt(index!).location;
    }
    if (mail == null) {
      mail = profile_list1?.elementAt(index!).mail;
    }
    if (phone_no == null) {
      phone_no = profile_list1?.elementAt(index!).phone_no;
    }
    if (link == null) {
      link = profile_list1?.elementAt(index!).social_link;
    }

    if (name!.isEmpty ||
        location!.isEmpty ||
        phone_no!.isEmpty ||
        mail!.isEmpty ||
        link!.isEmpty ||
        name == null ||
        location == null ||
        phone_no == null ||
        link == null ||
        mail == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (name!.isNotEmpty &&
        location!.isNotEmpty &&
        phone_no!.isNotEmpty &&
        mail!.isNotEmpty &&
        link!.isNotEmpty &&
        name != null &&
        location != null &&
        phone_no != null &&
        link != null &&
        mail != null) {
      profile_list1?.elementAt(index!).name = name;
      profile_list1?.elementAt(index!).location = location;
      profile_list1?.elementAt(index!).mail = mail;
      profile_list1?.elementAt(index!).social_link = link;
      profile_list1?.elementAt(index!).phone_no = phone_no;
      profile_list1?.elementAt(index!).tableName = form_name1;
      profile_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class Project_fillup_widget extends StatelessWidget {
  int? index;
  String? project_name;
  String? project_brief;
  String? project_type;
  String? project_duration;

  Project_fillup_widget({this.index});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        project_list1?.elementAt(index!).qualification_name,
                    onChanged: (text) => project_name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter project name',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        project_list1?.elementAt(index!).organization_name,
                    onChanged: (text) => project_type = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Project type - Group/Self',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list1?.elementAt(index!).brief,
                    onChanged: (text) => project_brief = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Brief your project',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list1?.elementAt(index!).year_duration,
                    onChanged: (text) => project_duration = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        project_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void project_data_upload(BuildContext context) {
    if (project_name == null) {
      project_name = project_list1?.elementAt(index!).qualification_name;
    }
    if (project_type == null) {
      project_type = project_list1?.elementAt(index!).organization_name;
    }
    if (project_brief == null) {
      project_brief = project_list1?.elementAt(index!).brief;
    }
    if (project_duration == null) {
      project_duration = project_list1?.elementAt(index!).year_duration;
    }

    if (project_name!.isEmpty ||
        project_type!.isEmpty ||
        project_brief!.isEmpty ||
        project_duration!.isEmpty ||
        project_name == null ||
        project_type == null ||
        project_brief == null ||
        project_duration == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (project_name!.isNotEmpty &&
        project_type!.isNotEmpty &&
        project_brief!.isNotEmpty &&
        project_duration!.isNotEmpty &&
        project_name != null &&
        project_type != null &&
        project_brief != null &&
        project_duration != null) {
      project_list1?.elementAt(index!).qualification_name = project_name;
      project_list1?.elementAt(index!).organization_name = project_type;
      project_list1?.elementAt(index!).brief = project_brief;
      project_list1?.elementAt(index!).year_duration = project_duration;
      project_list1?.elementAt(index!).tableName = form_name1;
      project_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class language_fillup_widget extends StatelessWidget {
  int? index;
  String? skill_name;

  language_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: (text) => skill_name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    initialValue: language_list1?.elementAt(index!).value,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter langauage name',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        language_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void language_data_upload(BuildContext context) {
    if (skill_name == null) {
      skill_name = language_list1?.elementAt(index!).value;
    }

    if (skill_name!.isEmpty || skill_name == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (skill_name!.isNotEmpty && skill_name != null) {
      language_list1?.elementAt(index!).value = skill_name;
      language_list1?.elementAt(index!).tableName = form_name1;
      language_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class Skill_fillup_widget extends StatelessWidget {
  int? index;
  String? skill_name;

  Skill_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: (text) => skill_name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    initialValue: skill_list1?.elementAt(index!).value,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter skill name',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        skill_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void skill_data_upload(BuildContext context) {
    if (skill_name == null) {
      skill_name = skill_list1?.elementAt(index!).value;
    }

    if (skill_name!.isEmpty || skill_name == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (skill_name!.isNotEmpty && skill_name != null) {
      skill_list1?.elementAt(index!).value = skill_name;
      skill_list1?.elementAt(index!).tableName = form_name1;
      skill_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class Achievement_fillup_widget extends StatelessWidget {
  int? index;
  String? ach_name;
  String? ach_org;

  Achievement_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        achievement_list1?.elementAt(index!).qualification_name,
                    onChanged: (text) => ach_name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Achievement',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        achievement_list1?.elementAt(index!).organization_name,
                    onChanged: (text) => ach_org = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Issued by - ',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        achievement_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void achievement_data_upload(BuildContext context) {
    if (ach_name == null) {
      ach_name = achievement_list1?.elementAt(index!).qualification_name;
    }
    if (ach_org == null) {
      ach_org = achievement_list1?.elementAt(index!).organization_name;
    }

    if (ach_name!.isEmpty ||
        ach_org!.isEmpty ||
        ach_name == null ||
        ach_org == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (ach_name!.isNotEmpty &&
        ach_org!.isNotEmpty &&
        ach_name != null &&
        ach_org != null) {
      achievement_list1?.elementAt(index!).qualification_name = ach_name;
      achievement_list1?.elementAt(index!).organization_name = ach_org;
      achievement_list1?.elementAt(index!).tableName = form_name1;
      achievement_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class Work_fillup_widget extends StatelessWidget {
  int? index;
  String? project_name;
  String? project_brief;
  String? project_type;
  String? project_duration;

  Work_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        work_list1?.elementAt(index!).qualification_name,
                    onChanged: (text) => project_name = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter work qualification',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        work_list1?.elementAt(index!).organization_name,
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: (text) => project_type = text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter organization name',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list1?.elementAt(index!).brief,
                    onChanged: (text) => project_brief = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Brief your work',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list1?.elementAt(index!).year_duration,
                    onChanged: (text) => project_duration = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        work_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void work_data_upload(BuildContext context) {
    if (project_name == null) {
      project_name = work_list1?.elementAt(index!).qualification_name;
    }
    if (project_type == null) {
      project_type = work_list1?.elementAt(index!).organization_name;
    }
    if (project_brief == null) {
      project_brief = work_list1?.elementAt(index!).brief;
    }
    if (project_duration == null) {
      project_duration = work_list1?.elementAt(index!).year_duration;
    }

    if (project_name!.isEmpty ||
        project_type!.isEmpty ||
        project_brief!.isEmpty ||
        project_duration!.isEmpty ||
        project_name == null ||
        project_type == null ||
        project_brief == null ||
        project_duration == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (project_name!.isNotEmpty &&
        project_type!.isNotEmpty &&
        project_brief!.isNotEmpty &&
        project_duration!.isNotEmpty &&
        project_name != null &&
        project_type != null &&
        project_brief != null &&
        project_duration != null) {
      work_list1?.elementAt(index!).qualification_name = project_name;
      work_list1?.elementAt(index!).organization_name = project_type;
      work_list1?.elementAt(index!).brief = project_brief;
      work_list1?.elementAt(index!).year_duration = project_duration;
      work_list1?.elementAt(index!).tableName = form_name1;
      work_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class Education_fillup_widget extends StatelessWidget {
  int? index;
  String? edu_name;
  String? edu_org;
  String? edu_duration;

  Education_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue:
                        edu_list1?.elementAt(index!).qualification_name,
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: (text) => edu_name = text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter education qualification',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: edu_list1?.elementAt(index!).organization_name,
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: (text) => edu_org = text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter organization name',
                    ),
                  ),
                ),
                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: edu_list1?.elementAt(index!).year_duration,
                    onChanged: (text) => edu_duration = text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),
                  ),
                ),
                new Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        edu_data_upload(context);
                      },
                      child: Text('Save'),
                    )),
              ])),
    );
  }

  void edu_data_upload(BuildContext context) {
    if (edu_name == null) {
      edu_name = edu_list1?.elementAt(index!).qualification_name;
    }
    if (edu_org == null) {
      edu_org = edu_list1?.elementAt(index!).organization_name;
    }
    if (edu_duration == null) {
      edu_duration = edu_list1?.elementAt(index!).year_duration;
    }

    if (edu_name!.isEmpty ||
        edu_org!.isEmpty ||
        edu_duration!.isEmpty ||
        edu_name == null ||
        edu_org == null ||
        edu_duration == null) {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (edu_name!.isNotEmpty &&
        edu_org!.isNotEmpty &&
        edu_duration!.isNotEmpty &&
        edu_name != null &&
        edu_org != null &&
        edu_duration != null) {
      edu_list1?.elementAt(index!).qualification_name = edu_name;
      edu_list1?.elementAt(index!).organization_name = edu_org;
      edu_list1?.elementAt(index!).year_duration = edu_duration;
      edu_list1?.elementAt(index!).tableName = form_name1;
      edu_list1?.elementAt(index!).id = form_name1! + index.toString();
      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
