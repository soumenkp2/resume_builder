import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resume_builder/ResumeTemplates/Resume_temp1.dart';
import 'package:resume_builder/Screens/FormListPage.dart';
import '../ResumeTemplates/Resume_temp2.dart';
import 'info_fillup.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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


