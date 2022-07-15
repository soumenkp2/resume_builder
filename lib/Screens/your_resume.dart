import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/AppUtils/BoxImage.dart';
import 'package:resume_builder/AppUtils/CurvedWidget.dart';
import 'package:resume_builder/AppUtils/TextWidget.dart';
import 'package:resume_builder/Screens/main.dart';


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
      body: Container(
        color: Colors.white38,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurvedWidget(
                s: "Your Resume",
                size: 25,
                color: Color(0xFF011639),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.only(left: 25),
                    child: const TextWidget(
                        text: "Preview your Resume",
                        size: 20.0,
                        color: Color(0xFF000000))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "1",imagePath: 'Images/img.png',
                  ),
                  BoxImage(
                      text: "2",imagePath: 'Images/img.png'
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "3",imagePath: 'Images/img.png',
                  ),
                  BoxImage(
                      text: "4",imagePath: 'Images/img.png'
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "5",imagePath: 'Images/img.png',
                  ),
                  BoxImage(
                      text: "6",imagePath: 'Images/img.png'
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "7",imagePath: 'Images/img.png',
                  ),
                  BoxImage(
                      text: "8",imagePath: 'Images/img.png'
                  ),
                ],
              ),
            ],
          ),
        ),
      ),





    );
  }

}