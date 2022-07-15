import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header_Widget extends StatelessWidget {

  double? height;
  double? margin_top;
  double? margin_bottom;
  double? margin_left;
  double? margin_right;

  String? name;
  String? phone;
  String? mail;
  String? address;
  String? link;





  Header_Widget({
    this.height,
    this.margin_top,
    this.margin_bottom,
    this.margin_left,
    this.margin_right,

    this.name,
    this.phone,
    this.mail,
    this.address,
    this.link
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      //color: Colors.limeAccent,
      height: height,
      color: Colors.teal,
      margin: EdgeInsets.fromLTRB(margin_left!, margin_top!, margin_right!, margin_bottom!),
      //padding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                  name!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600))
              ),


              // Container(
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(color: Colors.lightGreen,width: 3.0),
              //     ),
              //   ),
              // ),

              new Padding(
                  padding: const EdgeInsets.all(5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                            phone!,
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
                            mail!,
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
                            link!,
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
                            address!,
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