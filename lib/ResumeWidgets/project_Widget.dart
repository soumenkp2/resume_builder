import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Work_Projects_UserModel.dart';

class project_Widget extends StatelessWidget {

  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? color;
  String? txt_color;
  String? high_color;


  List<Work_Projects_UserModel>? project_list;



  project_Widget({
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,
    this.project_list,

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
                  "Projects",
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
      dur_name: project_list?.elementAt(index).year_duration,
      high_color: high_color

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

  String? project_name;
  String? type;
  String? dur_name;
  String? brief;
  String? high_color;


  Experience_Details({
    this.project_name,

    this.type,

    this.dur_name,

    this.brief,

    this.high_color

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
