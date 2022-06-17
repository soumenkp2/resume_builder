import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';


class your_resume extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => your_resume_state();

}

class your_resume_state extends State<your_resume>
{

  @override
  void initState()
  {
    super.initState();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Text("Your Resume"),
      ),





    );
  }

}