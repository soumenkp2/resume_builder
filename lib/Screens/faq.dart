import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/AppUtils/CurvedWidget.dart';
import 'package:resume_builder/Screens/privacy_policy.dart';
import 'package:resume_builder/Screens/terms_and_conditions.dart';

class faq extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => faq_state();
}

class faq_state extends State<faq> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    //onstart();
    //Navigator.of(context).pushNamed('splash_screen');
  }

  void moveToPrivacyPolicy() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => privacy_policy()));
  }

  void moveToTnC()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => terms_and_conditions()));
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
                s: "FAQs",
                size: 26,
                color: Color(0xFF011639),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Text('Have Some Doubts?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(),
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
              ExpansionTile(
                title: Text('How to Create Resume?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(), fontWeight: FontWeight.bold)),
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Choose your preferred template from the choices given, fill up your details like: Education, Work, Skills, etc., and click on Save button. Once filled every such sections click on Next button to prepare your Resume 😉',
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.09,
                          style: GoogleFonts.poppins(textStyle: TextStyle()))),
                ],
              ),
              ExpansionTile(
                title: Text(
                    'What are the examples of co-curricular activities?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(), fontWeight: FontWeight.bold)),
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Co-curricular activities includes: Debating, Dancing, Essay Writing, Indoor Sports, Outdoor Sports, Being active in School Clubs.',
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.09,
                          style: GoogleFonts.poppins(textStyle: TextStyle()))),
                ],
              ),
              ExpansionTile(
                title: Text(
                    'What are the some of the examples of Projects to list on a resume?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(), fontWeight: FontWeight.bold)),
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                          'BaraBazaar- Studied & Analyzed the Production & Operations of the Market. \nBusiness Plan- Created an idea to open a ladies garment business in the form of boutique.',
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.09,
                          style: GoogleFonts.poppins(textStyle: TextStyle()))),
                ],
              ),
              ExpansionTile(
                title: Text(
                    'Should we disclose our expected CTC in our resume?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(), fontWeight: FontWeight.bold)),
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                          'Advisably you should avoid mentioning your expected CTC(cost to company). Neither the percent of the hike you are looking for nor the exact figure you are getting in the company.',
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.09,
                          style: GoogleFonts.poppins(textStyle: TextStyle()))),
                ],
              ),
              ExpansionTile(
                title: Text('Which skills should I list?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(), fontWeight: FontWeight.bold)),
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'We recommend you tailor each resume to each job you are applying for so you can match your skills to the employers needs.',
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.09,
                          style: GoogleFonts.poppins(textStyle: TextStyle()))),
                ],
              ),

              // const SizedBox(
              //   height: 40,
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Privacy Policy", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                    ),
                    onTap: () {
                      moveToPrivacyPolicy();
                      },
              ),
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Terms and Conditions", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                  ),
                  onTap: () {
                    moveToTnC();
                  },
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
