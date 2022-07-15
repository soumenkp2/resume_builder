import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Education_UserModel{

  String? name;
  String? phone_no;
  String? mail;
  String? location;
  String? social_link;


  //Initialiazing the values
  Education_UserModel({
    this.name,
    this.phone_no,
    this.location,
    this.mail,
    this.social_link
  });

  //Setting values in map to use it further
  Map<String,String> toJson()
  {
    final Map<String,String> data = new Map<String, String>();

    data["name"] = name!;
    data["location"] = location!;
    data["phone_no"] = phone_no!;
    data["mail"] = mail!;
    data["social_link"] = social_link!;

    return data;
  }


}
