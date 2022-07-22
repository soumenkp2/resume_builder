import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UserModels/Profile_UserModel.dart';

class header_Widget extends StatelessWidget {

  double? height;
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  List<Profile_UserModel>? profile_list;

  String? name;
  String? phone_no;
  String? link;
  String? mail;
  String? address;
  String? color;



  header_Widget({
    this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,
    this.profile_list,
    this.color,
  });

  String set_values(String str)
  {
    name = profile_list?.elementAt(0).name!;
    phone_no = profile_list?.elementAt(0).phone_no;
    mail = profile_list?.elementAt(0).mail;
    link = profile_list?.elementAt(0).social_link;
    address = profile_list?.elementAt(0).location;

    if(str=="name")
      {
        return name!;
      }
    else if(str=="phone")
      {
        return phone_no!;
      }
    else if(str == "mail")
      {
        return mail!;
      }
    else if(str == "link")
      {
        return link!;
      }
    else if(str == "address")
      {
        return address!;
      }
    else
      {
        return "";
      }

  }

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
    else
      {
        return Colors.black;
      }
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      //color: Colors.limeAccent,
      height: height,
      color: set_color(color!),
      margin: EdgeInsets.fromLTRB(margin_left!, margin_top!, margin_right!, margin_bottom!),
      //padding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                  set_values("name"),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600))
              ),


              new Padding(
                  padding: const EdgeInsets.all(5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                            set_values("phone"),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        new Text(
                            set_values("mail"),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                        ),



                      ])
              ),

              new Padding(
                  padding: const EdgeInsets.all(5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                            set_values("link"),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        new Text(
                            set_values("address"),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                        ),



                      ])
              )

            ]),


      )

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
          width: 100,
          child: Text(
              skill_name!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal))
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 1),
            ],
          ),

        )


    );
  }
}