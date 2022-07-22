import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Skills_Languages_UserModel{

  String? value;

  //Initialiazing the values
  Skills_Languages_UserModel({
    this.value
  });

  //Setting values in map to use it further
  Map<String,String> toJson()
  {
    final Map<String,String> data = new Map<String, String>();

    data["value"] = value!;

    return data;
  }

  Skills_Languages_UserModel.fromDbMap(Map<String, dynamic> data)
      : value = data["value"];

}
