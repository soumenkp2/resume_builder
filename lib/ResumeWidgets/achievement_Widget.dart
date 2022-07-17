import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Achievements_UserModel.dart';

class achievement_Widget extends StatelessWidget {

  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;


  List<Achievements_UserModel>? achievement_list;

  achievement_Widget({
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.achievement_list,
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


            ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    achievements(index,achievement_list),
                  ]);
                },
                separatorBuilder: (context, index) => new SizedBox.shrink(),
                itemCount: achievement_list!.length),


          ]),


    );
  }

  achievements(int index, List<Achievements_UserModel>? achievement_list) {
    return Course_Details(
      course_name: achievement_list?.elementAt(index).qualification_name,
      org_name: achievement_list?.elementAt(index).organization_name,
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

