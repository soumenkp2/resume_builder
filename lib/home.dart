import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';




class home extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => home_state();

}

class home_state extends State<home>
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
          child: Text("Home"),
        ),





    );
  }

}