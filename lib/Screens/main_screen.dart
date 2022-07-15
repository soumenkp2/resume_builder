import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'home.dart';
import 'your_resume.dart';
import 'profile.dart';

class main_screen extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => main_screen_state();

}

class main_screen_state extends State<main_screen>
{

  var pages_date = [home(),your_resume(),profile()];

  int selected_item = 0;

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
        body: Center(
          child: pages_date[selected_item],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: "Your Resume"),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile")
          ],
          currentIndex: selected_item,
          onTap: (setValue)
          {
            setState(() {
              selected_item = setValue;
            });
          },
        )




    );
  }

}