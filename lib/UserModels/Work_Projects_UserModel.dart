import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Work_Projects_UserModel{

  String? organization_name;
  String? qualification_name;
  String? brief;
  String? year_duration;

  //Initialiazing the values
  Work_Projects_UserModel({
    this.organization_name,
    this.year_duration,
    this.qualification_name,
    this.brief
  });

  //Setting values in map to use it further
  Map<String,String> toJson()
  {
    final Map<String,String> data = new Map<String, String>();

    data["organization_name"] = organization_name!;
    data["qualification_name"] = qualification_name!;
    data["year_duration"] = year_duration!;
    data["brief"] = brief!;

    return data;
  }
  Work_Projects_UserModel.fromDbMap(Map<String, dynamic> data)
      : organization_name = data["organization_name"],
        qualification_name = data["qualification_name"],
        year_duration = data["year_duration"],
        brief = data["brief"];

}
