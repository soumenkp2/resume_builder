import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';




class profile extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => profile_state();

}

class profile_state extends State<profile>
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
        child: Text("Profile"),
      ),





    );
  }

}