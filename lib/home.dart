import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';
import 'package:google_fonts/google_fonts.dart';



class home extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => home_state();

}

class home_state extends State<home>
{

  @override
  void initState()
  {
    super.initState();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // Row -> menu btn and search btn (Coloumn child 1)
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  new Container(
                    padding: const EdgeInsets.fromLTRB(10,0,20,0),
                       child: new Image.asset(
                       'assets/images/menu.png',
                         height: 40.0,
                         fit: BoxFit.cover,
                        ),
                      ),


                  new Container(
                    padding: const EdgeInsets.fromLTRB(0,10,20,0),
                        child: new Image.asset(
                          'assets/images/search.png',
                          height: 35.0,
                          fit: BoxFit.cover,
                        ),
                      ),

                ],
              ),

              new Container(
                //color: Colors.amberAccent,
                height: 140,
                  margin: const EdgeInsets.fromLTRB(10,10,10,0),
                decoration: BoxDecoration(
                  color: const Color(0xffd4e3ea),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          )

                        ),

                        new Text("Resume Builder allows you to\n customize your own resumes\n with various categorization",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
                            ),
                          maxLines: 4,

                        )

                      ]


                    )


                  ]
                )

              ),



              new Container(
                  margin: const EdgeInsets.fromLTRB(10,30,20,0),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[

                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            new Text("Make Your Resume",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                                )
                            ),

                                new Text("See All",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 10)
                                )
                                )

                          ]
                        ),


                             new SizedBox(
                               height: 150,
                             child: ListView(
                                 scrollDirection: Axis.horizontal,
                               padding: const EdgeInsets.all(8),
                                 children: <Widget>[

                                   new Container(
                                     width: 150,
                                     decoration: BoxDecoration(
                                       color: const Color(0xffd4e3ea),
                                       borderRadius: BorderRadius.all(Radius.circular(25)),
                                     ),
                               margin: const EdgeInsets.fromLTRB(0,0,10,0),
                               child: new Image.asset(
                               'assets/images/profile.png',
                               height: 35.0,
                               fit: BoxFit.cover,
                             ),
                                   ),

                                   new Container(
                                       width: 150,
                                     decoration: BoxDecoration(
                                       color: const Color(0xffd4e3ea),
                                       borderRadius: BorderRadius.all(Radius.circular(25)),
                                     ),
                                     margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                     child: new Image.asset(
                                       'assets/images/profile.png',
                                       height: 35.0,
                                       fit: BoxFit.cover,
                                     ),
                                   ),

                                   new Container(
                                   width: 150,
                                     decoration: BoxDecoration(
                                       color: const Color(0xffd4e3ea),
                                       borderRadius: BorderRadius.all(Radius.circular(25)),
                                     ),
                                     margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                     //padding: const EdgeInsets.all(20),
                                     child: new Image.asset(
                                       'assets/images/profile.png',
                                       fit: BoxFit.cover,
                                     ),
                                   ),

                                   new Container(
                                     width: 150,
                                     decoration: BoxDecoration(
                                       color: const Color(0xffd4e3ea),
                                       borderRadius: BorderRadius.all(Radius.circular(25)),
                                     ),
                                     margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                     //padding: const EdgeInsets.all(20),
                                     child: new Image.asset(
                                       'assets/images/profile.png',
                                       fit: BoxFit.cover,
                                     ),
                                   ),

                                   new Container(
                                     width: 150,
                                     decoration: BoxDecoration(
                                       color: const Color(0xffd4e3ea),
                                       borderRadius: BorderRadius.all(Radius.circular(25)),
                                     ),
                                     margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                     //padding: const EdgeInsets.all(20),
                                     child: new Image.asset(
                                       'assets/images/profile.png',
                                       fit: BoxFit.cover,
                                     ),
                                   ),



                                 ]

                             )),






                      ]
                  )


              ),


            new Container(
              margin: const EdgeInsets.fromLTRB(10,30,20,0),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          new Text("Make Your Resume",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                              )
                          ),

                          new Text("See All",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 10)
                              )
                          )

                        ]
                    ),


                    new SizedBox(
                        height: 150,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            children: <Widget>[

                              new Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd4e3ea),
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                child: new Image.asset(
                                  'assets/images/profile.png',
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              new Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd4e3ea),
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                child: new Image.asset(
                                  'assets/images/profile.png',
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              new Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd4e3ea),
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                //padding: const EdgeInsets.all(20),
                                child: new Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              new Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd4e3ea),
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                //padding: const EdgeInsets.all(20),
                                child: new Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              new Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color(0xffd4e3ea),
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                margin: const EdgeInsets.fromLTRB(0,0,10,0),
                                //padding: const EdgeInsets.all(20),
                                child: new Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),



                            ]

                        )),






                  ]
              )
            ),


              ],
          )
        )





    );
  }

}