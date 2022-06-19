import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/main.dart';


class your_resume extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => your_resume_state();

}

class your_resume_state extends State<your_resume> {

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
      body: Column(
        children: [
          Container(
              height: 180,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18),
                ),
                color: Color(0xFF78CBEC),
              ),
              child: Stack(
                children: [
                Positioned(
                top: 70,
                left: 0,
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                )
                ),
                  Positioned(
                    top: 100,
                      left: 20,
                      child: Text('Your Resume', style: TextStyle(fontSize: 25, color: Color(0xFF78CBEC))))
                ],
              ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                    left: 20,
                    child: Material(

                      child: Container(
                        height: 170,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow :[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: new Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0),
                          ],
                        ),
                      ),
                    ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/resume.png'),
                        ),
                        boxShadow :[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: new Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}