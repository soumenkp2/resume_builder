import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/AppUtils/BoxImage.dart';
import 'package:resume_builder/AppUtils/CurvedWidget.dart';
import 'package:resume_builder/AppUtils/TextWidget.dart';

class profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => profile_state();
}

class profile_state extends State<profile> {
  @override
  void initState() {
    super.initState();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurvedWidget(
                s: "Profile",
                size: 25,
                color: Color(0xFF000000),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.only(left: 25),
                    child: const TextWidget(
                        text: "Sections",
                        size: 25.0,
                        color: Color(0xFF000000))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "Profile Details",imagePath: 'Images/img.png',
                  ),
                  BoxImage(
                    text: "Education",imagePath: 'Images/img.png'
                  ),
                  BoxImage(
                    text: "Experience",imagePath: 'Images/img.png'
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "Skills",imagePath: 'Images/img.png'
                  ),
                  BoxImage(
                    text: "Objective",imagePath: 'Images/img.png'
                  ),
                  BoxImage(
                    text: "Reference",imagePath: 'Images/img.png'
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.only(left: 25, top: 20),
                    child: const TextWidget(
                        text: "More Sections",
                        size: 25.0,
                        color: Color(0xFF000000))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxImage(
                    text: "Projects",imagePath: 'Images/img.png'
                  ),
                  BoxImage(
                    text: "Add More Section",imagePath: 'Images/img.png'
                  ),
                  BoxImage(
                    text: "Rearrange/ Edit Headings",imagePath: 'Images/img.png'
                  )
                ],
              ),
              BoxImage(text: "Help",imagePath: 'images/menu.png'),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}