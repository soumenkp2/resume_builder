import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';

class splash_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => splash_state();
}

class splash_state extends State<splash_screen> {
  @override
  void initState() {
    navigate_to_home();
    super.initState();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new main_screen(0)));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new onboarding_screen()));
    }
  }

  navigate_to_home() async {
    await Future.delayed(Duration(milliseconds: 7500), () {});
    checkFirstSeen();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => onboarding_screen()));
  }

  final text_style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
              child: Image.asset('assets/images/resume_app_logo.png',
                  height: 200, width: 200)),
          SizedBox(height: 100),
          Text("Resume Builder",
              style: GoogleFonts.poppins(textStyle: text_style))
          // child: Image.asset('assets/images/profile.png',
          //     height: 200,
          //     width: 200),
        ],
      ),
    ));
  }
}
