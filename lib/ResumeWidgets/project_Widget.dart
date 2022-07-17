import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Work_Projects_UserModel.dart';

class project_Widget extends StatelessWidget {

  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  List<Work_Projects_UserModel>? project_list;



  project_Widget({
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,
    this.project_list,


  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      //color: Colors.limeAccent,
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


            ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    projects(index,project_list),
                  ]);
                },
                separatorBuilder: (context, index) => new SizedBox.shrink(),
                itemCount: project_list!.length),


          ]),


    );
  }

  projects(int index, List<Work_Projects_UserModel>? project_list) {

    return Experience_Details(
      project_name: project_list?.elementAt(index).qualification_name,
      type: project_list?.elementAt(index).organization_name,
      brief: project_list?.elementAt(index).brief,
      dur_name: project_list?.elementAt(index).year_duration

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
