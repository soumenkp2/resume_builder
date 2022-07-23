import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Work_Projects_UserModel.dart';

class experience_Widget extends StatelessWidget {

  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  List<Work_Projects_UserModel>? work_list;

  String? color;
  String? txt_color;
  String? high_color;


  //double? height;
  double? margin_top;
  experience_Widget({
   // this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.work_list,

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
      //height: height,
      margin: EdgeInsets.fromLTRB(margin_left!, margin_top!, margin_right!, margin_bottom!),
      //padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Container(
              child: Text(
                  "Work Experience",
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
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    experiences(index,work_list),
                  ]);
                },
                separatorBuilder: (context, index) => new SizedBox.shrink(),
                itemCount: work_list!.length),


          ]),


    );
  }

  experiences(int index, List<Work_Projects_UserModel>? work_list) {

    return Experience_Details(
      experience_name: work_list?.elementAt(index).qualification_name,
      org_name: work_list?.elementAt(index).organization_name,
      brief: work_list?.elementAt(index).brief,
      dur_name: work_list?.elementAt(index).year_duration,
      high_color: high_color,
    );

  }
}

class Experience_Details extends StatelessWidget {

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

  String? experience_name;
  String? org_name;
  String? dur_name;
  String? brief;

  String? high_color;

  Experience_Details({
    this.experience_name,

    this.org_name,

    this.dur_name,

    this.brief,
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
                  experience_name!,
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
