import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';

class Profile_UserModel {
  String?id;
  String? tableName;
  String? name;
  String? phone_no;
  String? mail;
  String? location;
  String? social_link;


  //Initialiazing the values
  Profile_UserModel({
    this.name,
    this.phone_no,
    this.location,
    this.mail,
    this.social_link,
    this.id
  });

  //Setting values in map to use it further
  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();

    data["name"] = name!;
    data["location"] = location!;
    data["phone_no"] = phone_no!;
    data["mail"] = mail!;
    data["social_link"] = social_link!;
    data["tableName"] = tableName!;
    data['id']=id!;
    return
    data;
  }

  Profile_UserModel.fromDbMap(Map<String, dynamic> data)
      : name = data["name"],
        location = data["location"],
        phone_no = data["phone_no"],
        mail = data["mail"],
        social_link = data["social_link"],
        tableName=data['tableName'],
        id=data['id'];


}
