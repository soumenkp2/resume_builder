import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Achievements_UserModel.dart';

class achievement_Widget extends StatelessWidget {

  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;
  String? color;
  String? txt_color;
  String? high_color;


  List<Achievements_UserModel>? achievement_list;

  achievement_Widget({
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.achievement_list,
    this.color,
    this.txt_color,
    this.high_color,

  });

  Color set_color(String str)
  {
    if(str == "teal")
    {
      return Colors.teal;
    }
    else if(str == "blueGrey")
    {
      return Colors.blueGrey;
    }
    else if(str == "brown")
    {
      return Colors.brown;
    }
    else if(str == "white")
    {
      return Colors.transparent;
    }
    else
    {
      return Colors.transparent;
    }
  }

  Color set_txt_color(String str)
  {
    if(str == "white")
    {
      return Colors.white;
    }
    else if(str == "black")
    {
      return Colors.black;
    }
    else if(str == "indigo")
    {
      return Colors.indigo;
    }
    else
    {
      return Colors.black;
    }
  }


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
            new Container(
              child: Text(
                  "Achievements",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: set_txt_color(txt_color!),
                          //backgroundColor: Colors.amber,
                          fontWeight: FontWeight.bold))
              ),
              color: set_color(color!),
              width: double.infinity,
            ),
            new Divider(
              color: Colors.black,
              thickness: 3,
            ),


            ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
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
      high_color: high_color
    );
  }

}


class Course_Details extends StatelessWidget {

  Color set_color(String str)
  {
    if(str == "teal")
    {
      return Colors.teal;
    }
    else if(str == "blueGrey")
    {
      return Colors.blueGrey;
    }
    else if(str == "brown")
    {
      return Colors.brown;
    }
    else if(str == "white")
    {
      return Colors.transparent;
    }
    else
    {
      return Colors.transparent;
    }
  }

  String? course_name;
  String? org_name;
  String? high_color;

  Course_Details({
    this.course_name,
    this.org_name,
    this.high_color,

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
                          color: set_color(high_color!),
                          fontSize: 10,
                          fontWeight: FontWeight.w600))
              ),


              new Divider(
                color: Colors.grey,
              ),


            ]));
  }
}

