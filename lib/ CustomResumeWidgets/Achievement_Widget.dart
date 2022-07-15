import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Achievement_Widget extends StatelessWidget {

  double? height;
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? course1_name;
  String? org1_name;

  String? course2_name;
  String? org2_name;

  String? course3_name;
  String? org3_name;

  String? course4_name;
  String? org4_name;

  String? course5_name;
  String? org5_name;


  Achievement_Widget({
    this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.course1_name,
    this.course2_name,
    this.course3_name,

    this.org1_name,
    this.org2_name,
    this.org3_name,

    this.course4_name,
    this.course5_name,
    this.org4_name,
    this.org5_name
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      //color: Colors.limeAccent,
      height: height,
      margin: EdgeInsets.fromLTRB(margin_left!, margin_top!, margin_right!, margin_bottom!),
      //padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
                "Achievements",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
            ),
            new Divider(
              color: Colors.black,
              thickness: 3,
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(color: Colors.lightGreen,width: 3.0),
            //     ),
            //   ),
            // ),

            Course_Details(
                course_name: course1_name,
                org_name: org1_name,

            ),
            Course_Details(
                course_name: course2_name,
                org_name: org2_name,

            ),
            Course_Details(
                course_name: course3_name,
                org_name: org3_name,

            ),
            Course_Details(
              course_name: course4_name,
              org_name: org4_name,

            ),
            Course_Details(
              course_name: course5_name,
              org_name: org5_name,

            )


          ]),


    );
  }
}

class Course_Details extends StatelessWidget {

  String? course_name;
  String? org_name;


  Course_Details({
    this.course_name,

    this.org_name,

  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                  course_name!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500))
              ),

              new Text(
                  org_name!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 10,
                          fontWeight: FontWeight.w600))
              ),


              new Divider(
                color: Colors.grey,
              ),


            ]));
  }
}

