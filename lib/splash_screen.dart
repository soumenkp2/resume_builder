import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';

import 'main.dart';
import 'main_screen.dart';

class splash_screen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => splash_state();
}


class splash_state extends State<splash_screen>
{

  @override
  void initState()
  {
    super.initState();
    navigate_to_home();
  }
  
  navigate_to_home() async
  {
    await Future.delayed(Duration(milliseconds: 3500),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_screen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      )
    );
  }

}