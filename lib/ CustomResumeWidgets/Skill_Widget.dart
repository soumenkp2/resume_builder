import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Skill_Widget extends StatelessWidget {

  double? height;
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? skill1;
  String? skill2;
  String? skill3;
  String? skill4;
  String? skill5;



  Skill_Widget({
    this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.skill1,
    this.skill2,
    this.skill3,
    this.skill4,
    this.skill5
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
                "Skills",
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

            Skill_Details(
              skill_name: skill1
            ),

            Skill_Details(
                skill_name: skill2
            ),

            Skill_Details(
                skill_name: skill3
            ),

            Skill_Details(
                skill_name: skill4
            ),

            Skill_Details(
                skill_name: skill5
            )



          ]),


    );
  }
}

class Skill_Details extends StatelessWidget {

  String? skill_name;


  Skill_Details({
    this.skill_name

  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: Container(
        child: Text(
          skill_name!,
          style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.white,
        fontSize: 12,
            fontWeight: FontWeight.normal))
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
          boxShadow: [
            BoxShadow(color: Colors.teal, spreadRadius: 3),
          ],
        ),

      )


            );
  }
}