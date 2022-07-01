import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'main_screen.dart';

class onboarding_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => onboarding_screen_state();
}

class onboarding_screen_state extends State<onboarding_screen> {

  final controller = PageController();

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
                controller: controller,
                children: [

                  //Page 1
              Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        new Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: new Text(
                          "Create,\nProfessional Resumes",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.black87,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold)),
                          maxLines: 4,
                        ),
                        ),

                          new Container(
                            height: 400,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffd4e3ea),
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: new Image.asset(
                              'assets/images/onboarding_second.png',
                            ),
                          ),

                            ])
              ),

              //Page 2
              Container(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        new Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: new Text(
                            "Edit\nYour saved Resumes",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold)),
                            maxLines: 4,

                          ),
                        ),

                        new Container(
                          height: 400,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffd4e3ea),
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                          ),
                          margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: new Image.asset(
                            'assets/images/onboarding_first.png',
                          ),
                        ),

                      ])
              ),

              //Page 3
              Container(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        new Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: new Text(
                            "Opt\nResume Builder",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold)),
                            maxLines: 4,

                          ),
                        ),

                        new Container(
                          height: 400,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffd4e3ea),
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                          ),
                          margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: new Image.asset(
                            'assets/images/onboarding_third.png',
                          ),
                        ),

                      ])
              ),

            ])),

            //Bottom
            bottomSheet: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.all(0),
                    child: new Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      maxLines: 4,
                    ),
                  ),

                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black87,
                        activeDotColor: Colors.blueAccent
                      )
                    )
                  ),

                  new ElevatedButton(
                    child: new Text(
                      "Next",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      maxLines: 4,
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => main_screen()),
                      );
                    },
                  ),
                ],
              )


    ),

    );
  }
}