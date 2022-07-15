import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

import '../ResumeTemplates/Resume_temp1.dart';
import '../UserModels/Education_UserModel.dart';

class info_fillup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => info_fillup_state();
}

List<Education_UserModel>? edu_list;
Map<String, bool>? categories;

class info_fillup_state extends State<info_fillup> {
  @override
  void initState() {
    super.initState();
    edu_list = new List<Education_UserModel>.empty(growable: true);

    categories = new Map<String, bool>();
    categories!["education"] = false;
    categories!["achievements"] = false;
    categories!["language"] = false;
    categories!["skills"] = true;
    categories!["work"] = false;
    categories!["profile"] = false;
  }

  // void add_edu_card()
  // {
  //   setState(()
  //   {
  //     edu_list?.add(new Education_UserModel());
  //   });
  // }

  void category_observation(String category_name) {
    setState(() {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text(category_name),
      // ));
      categories?.forEach((key, value) {
        if (key == category_name) {
          categories![key] = true;
        } else {
          categories![key] = false;
        }
      });
    });
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new InkWell(
                    onTap: () {
                      category_observation("education");
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(color: Colors.teal, spreadRadius: 2),
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
                    category_observation("skills");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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
                    category_observation("achievements");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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
                    category_observation("work");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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
                    category_observation("profile");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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
                    category_observation("project");
                  },
                  child: new Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
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
              ],
            ),
          ),
        ),
        //Termination of Categories

        current_category(),
      ],
    )));
  }
}


class EducationParent_Widget extends StatelessWidget {
  const EducationParent_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 80, 0),
              child: new Text("Education",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            ),
            new InkWell(
              onTap: add_edu_card,
              child: new Padding(
                  padding: const EdgeInsets.all(10),
                  child: new Image.asset(
                    'assets/images/addbtn.png',
                    height: 35.0,
                    // fit: BoxFit.cover,
                  )),
            ),
            new Visibility(
              visible: true,
              child: new Padding(
                  padding: const EdgeInsets.all(10),
                  child: new Image.asset(
                    'assets/images/minusbtn.png',
                    height: 35.0,
                    // fit: BoxFit.cover,
                  )),
            ),
          ])),

      new Divider(
        color: Colors.black,
        thickness: 3,
      ),

      //Form Fill Up
      new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //current_category()
            Education_fillup_widget(),

            ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    Education_fillup_widget(),
                  ]);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: edu_list!.length)
          ]),
    ]);
  }

  add_edu_card() {
    edu_list?.add(new Education_UserModel());
  }
}

Widget current_category() {
  if (categories!["education"] == true) {
    return EducationParent_Widget();
  } else if (categories!["achievements"] == true) {
    return Text("Achievements");
  } else if (categories!["profile"] == true) {
    return Text("Profile");
  } else if (categories!["work"] == true) {
    return Text("Work");
  } else if (categories!["skills"] == true) {
    return Text("Skills");
  } else if (categories!["language"] == true) {
    return Text("Language");
  } else {
    return Education_fillup_widget();
  }
}

Widget Education_fillup_widget() {
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
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter starting-closing year',
                  ),
                ),
              ),
              new InkWell(
                onTap: add_s(),
              )
            ])),

// new Padding(
//     padding: const EdgeInsets.all(10),
//     child: new Image.asset(
//       'assets/images/addbtn.png',
//       height: 15.0,
//       // fit: BoxFit.cover,
//     )),
  );
}

add_s() {

}

// class Education_fillup_widget extends StatelessWidget {
//   const Education_fillup_widget({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new Padding(
//       padding: const EdgeInsets.all(10),
//       child: new Container(
//           // width: 50,
//           // height: 50,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(25)),
//             boxShadow: [
//               BoxShadow(color: Colors.teal, spreadRadius: 2),
//             ],
//           ),
//           margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//
//                 new Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Enter education qualification',
//                     ),),),
//
//                 new Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Enter organization name',
//                     ),),),
//
//                 new Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Enter starting-closing year',
//                     ),),),
//
//               ])),
//
//       // new Padding(
//       //     padding: const EdgeInsets.all(10),
//       //     child: new Image.asset(
//       //       'assets/images/addbtn.png',
//       //       height: 15.0,
//       //       // fit: BoxFit.cover,
//       //     )),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//
//   // Widget add_edu_widget()
//   // {
//   //   return Padding(
//   //
//   //
//   //
//   //
//   //   );
//   // }
//
// }
