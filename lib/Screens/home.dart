import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/info_fillup.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

import '../DataBase/DataBaseManager.dart';
import '../ResumeTemplates/Resume_temp1.dart';
import '../ResumeTemplates/Resume_temp2.dart';
import '../ResumeTemplates/Template_5.dart';
import '../ResumeTemplates/Template_6.dart';
import '../ResumeTemplates/Template_1.dart';
import '../ResumeTemplates/Template_2.dart';
import '../ResumeTemplates/Template_3.dart';
import '../ResumeTemplates/Template_4.dart';
import 'FormListPage.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => home_state();
}

class home_state extends State<home> {
  @override
  void initState() {
    var db= DataBaseManager.instance;
    super.initState();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }

  void moveToResume(int index)
  {
    if(index==1)
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 1)));
      }
    else if(index==2)
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 2)));
      }
    else if(index==3)
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>FormListPage(tableIndex: 3)));
    }
    else if(index==4)
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 4)));
    }
    else if(index==6)
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 6)));
    }
    else if(index==5)
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 5)));
    }
    else if(index ==0 )
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Resume_temp2()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white38,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Row -> menu btn and search btn (Coloumn child 1)
            // new Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     new Container(
            //       padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            //       child: new Image.asset(
            //         'assets/images/menu.png',
            //         height: 40.0,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     new Container(
            //       padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            //       child: new Image.asset(
            //         'assets/images/search.png',
            //         height: 35.0,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ],
            // ),
            // //Row -> menu btn and search terminates

            //App Header
            new Container(
                //color: Colors.amberAccent,
                height: 140,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  color: const Color(0xffd4e3ea),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Container(
                        child: new Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                      new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text("Make Your Resume",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            new Text(
                              "Resume Builder allows you to\n customize your own resumes\n with various categorization",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                              maxLines: 4,
                            )
                          ])
                    ])),
            //App Header Terminates

            //Make Your Resume Functionality
            new Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text("Choose",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))),
                            new Text("See All",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 10)))
                          ]),

                      new Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Your Resume Template",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),

                      ),
                      new SizedBox(
                          height: 400,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                              children: <Widget>[

                                // new InkWell(
                                //   onTap: (){moveToResume(0);},
                                //   child: Container(
                                //     //width: 150,
                                //       decoration: BoxDecoration(
                                //         color: const Color(0xffd4e3ea),
                                //         borderRadius:
                                //         BorderRadius.all(Radius.circular(25)),
                                //       ),
                                //       margin:
                                //       const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                //       child: new Padding(
                                //         padding: const EdgeInsets.all(0),
                                //         child : Image.asset(
                                //           'assets/images/resume_template1.png',
                                //           height: 35.0,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       )
                                //   ),
                                // ),

                                new InkWell(
                                        onTap: (){moveToResume(1);},
                                        child: Container(
                                          //width: 150,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffd4e3ea),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(25)),
                                            ),
                                            margin:
                                            const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            child: new Padding(
                                              padding: const EdgeInsets.all(0),
                                              child : Image.asset(
                                                'assets/images/template_1.png',
                                                height: 35.0,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                        ),
                                      ),

                                new InkWell(
                                  onTap: (){moveToResume(2);},
                                  child: Container(
                                    //width: 150,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd4e3ea),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                      ),
                                      margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: new Padding(
                                        padding: const EdgeInsets.all(0),
                                        child : Image.asset(
                                          'assets/images/template_2.png',
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                  ),
                                ),

                                new InkWell(
                                  onTap: (){moveToResume(3);},
                                  child: Container(
                                    //width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd4e3ea),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    ),
                                    margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //padding: const EdgeInsets.all(20),
                                    child: new Image.asset(
                                      'assets/images/template_3.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),


                                new InkWell(
                                  onTap: (){moveToResume(4);},
                                  child: Container(
                                    //width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd4e3ea),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    ),
                                    margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //padding: const EdgeInsets.all(20),
                                    child: new Image.asset(
                                      'assets/images/template_4.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                new InkWell(
                                  onTap: (){moveToResume(5);},
                                  child: Container(
                                    //width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd4e3ea),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    ),
                                    margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //padding: const EdgeInsets.all(20),
                                    child: new Image.asset(
                                      'assets/images/template_5.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                new InkWell(
                                  onTap: (){moveToResume(6);},
                                  child: Container(
                                    //width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd4e3ea),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    ),
                                    margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //padding: const EdgeInsets.all(20),
                                    child: new Image.asset(
                                      'assets/images/template_6.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),


                              ]
                          )
                      ),

                    ]
                )
            ),


            // new Container(
            //     margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
            //     child: new Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: <Widget>[
            //           new Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: <Widget>[
            //                 new Text("Make Your Resume",
            //                     style: GoogleFonts.poppins(
            //                         textStyle: TextStyle(
            //                             fontSize: 20,
            //                             fontWeight: FontWeight.bold))),
            //                 new Text("See All",
            //                     style: GoogleFonts.poppins(
            //                         textStyle: TextStyle(fontSize: 10)))
            //               ]),
            //           new SizedBox(
            //               height: 150,
            //               child: ListView(
            //                   scrollDirection: Axis.horizontal,
            //                   padding: const EdgeInsets.all(8),
            //                   children: <Widget>[
            //                     new Container(
            //                       width: 150,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xffd4e3ea),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(25)),
            //                       ),
            //                       margin:
            //                           const EdgeInsets.fromLTRB(0, 0, 10, 0),
            //                       child: new Image.asset(
            //                         'assets/images/profile.png',
            //                         height: 35.0,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     new Container(
            //                       width: 150,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xffd4e3ea),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(25)),
            //                       ),
            //                       margin:
            //                           const EdgeInsets.fromLTRB(0, 0, 10, 0),
            //                       child: new Image.asset(
            //                         'assets/images/profile.png',
            //                         height: 35.0,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     new Container(
            //                       width: 150,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xffd4e3ea),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(25)),
            //                       ),
            //                       margin:
            //                           const EdgeInsets.fromLTRB(0, 0, 10, 0),
            //                       //padding: const EdgeInsets.all(20),
            //                       child: new Image.asset(
            //                         'assets/images/profile.png',
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     new Container(
            //                       width: 150,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xffd4e3ea),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(25)),
            //                       ),
            //                       margin:
            //                           const EdgeInsets.fromLTRB(0, 0, 10, 0),
            //                       //padding: const EdgeInsets.all(20),
            //                       child: new Image.asset(
            //                         'assets/images/profile.png',
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     new Container(
            //                       width: 150,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xffd4e3ea),
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(25)),
            //                       ),
            //                       margin:
            //                           const EdgeInsets.fromLTRB(0, 0, 10, 0),
            //                       //padding: const EdgeInsets.all(20),
            //                       child: new Image.asset(
            //                         'assets/images/profile.png',
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                   ])),
            //         ]
            //     )
            // ),

          ],
        )
        )
    );
  }
}
