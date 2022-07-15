import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Project_Widget extends StatelessWidget {

  double? height;
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? project1_name;
  String? type1;
  String? dur1_name;
  String? brief1;

  String? project2_name;
  String? type2;
  String? dur2_name;
  String? brief2;


  Project_Widget({
    this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.project1_name,
    this.project2_name,

    this.type1,
    this.type2,

    this.dur1_name,
    this.dur2_name,

    this.brief1,
    this.brief2


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
                "Project",
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

            Experience_Details(
                project_name: project1_name,
                type: type1,
                dur_name: dur1_name,
                brief: brief1
            ),
            Experience_Details(
                project_name: project2_name,
                type: type2,
                dur_name: dur2_name,
                brief: brief2
            ),


          ]),


    );
  }
}

class Experience_Details extends StatelessWidget {

  String? project_name;
  String? type;
  String? dur_name;
  String? brief;


  Experience_Details({
    this.project_name,

    this.type,

    this.dur_name,

    this.brief

  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                  project_name!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500))
              ),

              new Text(
                  type!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 10,
                          fontWeight: FontWeight.w600))
              ),

              new Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                      brief!,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600))
                  )),

              new Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                      dur_name!,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600))
                  )),

              new Divider(
                color: Colors.grey,
              ),


            ]));
  }
}
