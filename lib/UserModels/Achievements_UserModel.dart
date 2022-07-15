import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Achievements_UserModel{

  String? organization_name;
  String? qualification_name;

  //Initialiazing the values
  Achievements_UserModel({
    this.organization_name,
    this.qualification_name,
  });

  //Setting values in map to use it further
  Map<String,String> toJson()
  {
    final Map<String,String> data = new Map<String, String>();

    data["organization_name"] = organization_name!;
    data["qualification_name"] = qualification_name!;

    return data;
  }


}
