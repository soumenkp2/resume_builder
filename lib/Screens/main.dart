import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resume_builder/ResumeTemplates/Resume_temp1.dart';
import '../ResumeTemplates/Resume_temp2.dart';
import 'info_fillup.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: //info_fillup()
                splash_screen()
      //Resume_temp2()

    );
  }

}


