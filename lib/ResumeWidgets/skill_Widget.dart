import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Skills_Languages_UserModel.dart';

class skill_Widget extends StatelessWidget {
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? color;
  String? txt_color;
  String? high_color;

  List<Skills_Languages_UserModel>? skill_list;

  skill_Widget({
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,
    this.skill_list,
    this.color,
    this.txt_color,
    this.high_color,
  });

  Color set_color(String str) {
    if (str == "teal") {
      return Colors.teal;
    } else if (str == "blueGrey") {
      return Colors.blueGrey;
    } else if (str == "brown") {
      return Colors.brown;
    } else if (str == "white") {
      return Colors.transparent;
    } else {
      return Colors.transparent;
    }
  }

  Color set_txt_color(String str) {
    if (str == "white") {
      return Colors.white;
    } else if (str == "black") {
      return Colors.black;
    } else if (str == "indigo") {
      return Colors.indigo;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      //color: Colors.limeAccent,
      margin: EdgeInsets.fromLTRB(
          margin_left!, margin_top!, margin_right!, margin_bottom!),
      //padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: Text("Skills",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: set_txt_color(txt_color!),
                          //backgroundColor: Colors.amber,
                          fontWeight: FontWeight.bold))),
              color: set_color(color!),
              width: double.infinity,
            ),
            new Divider(
              color: Colors.black,
              thickness: 3,
            ),
            new Align(
              alignment: Alignment.topLeft,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: skills(index, skill_list),
                      ),
                    ]);
                  },
                  separatorBuilder: (context, index) => new SizedBox.shrink(),
                  itemCount: skill_list!.length),
            )
          ]),
    );
  }

  skills(int index, List<Skills_Languages_UserModel>? skill_list) {
    return Skill_Details(
      skill_name: skill_list?.elementAt(index).value,
      color: high_color,
    );
  }
}

class Skill_Details extends StatelessWidget {
  String? skill_name;
  String? color;

  Skill_Details({
    this.skill_name,
    this.color,
  });

  Color set_color(String str) {
    if (str == "teal") {
      return Colors.teal;
    } else if (str == "blueGrey") {
      return Colors.blueGrey;
    } else if (str == "brown") {
      return Colors.brown;
    } else if (str == "white") {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
        child: Container(
          child: Text(skill_name!,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal))),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: set_color(color!),
            boxShadow: [
              BoxShadow(color: set_color(color!), spreadRadius: 3),
            ],
          ),
        ));
  }
}
