import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Education_UserModel{

  String? organization_name;
  String? qualification_name;
  String? year_duration;

  //Initialiazing the values
  Education_UserModel({
    this.organization_name,
    this.year_duration,
    this.qualification_name,
  });


  //Setting values in map to use it further
  Map<String,String> toJson()
  {
    final Map<String,String> edu_data = new Map<String, String>();

    edu_data["organization_name"] = organization_name!;
    edu_data["qualification_name"] = qualification_name!;
    edu_data["year_duration"] = year_duration!;

    return edu_data;
  }
  Education_UserModel.fromDbMap(Map<String, dynamic> edu_data)
      : organization_name= edu_data["organization_name"],
        qualification_name= edu_data["qualification_name"],
        year_duration= edu_data["year_duration"];


}
