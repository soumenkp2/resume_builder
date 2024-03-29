import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../DataBase/DataBaseManager.dart';
import 'FormListPage.dart';

late BannerAd ad;
bool adLoaded = false;

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => home_state();
}

class home_state extends State<home> {
  @override
  void initState() {
    var db = DataBaseManager.instance;
    super.initState();
    initBannerAd();
  }

  void moveToResume(int index) {
    if (index == 1) {
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Resume_temp2()));
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 1)));
    } else if (index == 2) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 2)));
    } else if (index == 3) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 3)));
    } else if (index == 4) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 4)));
    } else if (index == 6) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 6)));
    } else if (index == 5) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 5)));
    } else if (index == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormListPage(tableIndex: 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white38,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //App Header
                new Container(
                  //color: Colors.amberAccent,
                    height: 140,
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: const Color(0xffd4e3ea),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              'assets/images/profile.png',
                            ),
                          ),
                          new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text("Make Your Resume",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                new Text(
                                  "Resume Builder allows you to\n customize your own resumes\n with various categorization",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                  maxLines: 4,
                                )
                              ])
                        ])),
                //App Header Terminates

                //Make Your Resume Functionality
                new Container(
                    margin: const EdgeInsets.fromLTRB(10, 30, 20, 0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text("Choose",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold))),
                              ]),
                          new Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Your Resume Template",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                          new SizedBox(
                              height: 400,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  children: <Widget>[

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(1);
                                      },
                                      child: Container(
                                        //width: 150,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffd4e3ea),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: new Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Image.asset(
                                              'assets/images/template_1.png',
                                              height: 35.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(2);
                                      },
                                      child: Container(
                                        //width: 150,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffd4e3ea),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: new Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Image.asset(
                                              'assets/images/template_2.png',
                                              height: 35.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(3);
                                      },
                                      child: Container(
                                        //width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd4e3ea),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        //padding: const EdgeInsets.all(20),
                                        child: new Image.asset(
                                          'assets/images/template_3.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(4);
                                      },
                                      child: Container(
                                        //width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd4e3ea),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        //padding: const EdgeInsets.all(20),
                                        child: new Image.asset(
                                          'assets/images/template_4.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(5);
                                      },
                                      child: Container(
                                        //width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd4e3ea),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        //padding: const EdgeInsets.all(20),
                                        child: new Image.asset(
                                          'assets/images/template_5.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    new InkWell(
                                      onTap: () {
                                        moveToResume(6);
                                      },
                                      child: Container(
                                        //width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd4e3ea),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        //padding: const EdgeInsets.all(20),
                                        child: new Image.asset(
                                          'assets/images/template_6.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ])),
                        ])),


                Container(
                  alignment: Alignment.center,
                  height: ad.size.height.toDouble(),
                  width: ad.size.width.toDouble(),
                  child : set_ad()
                )

              ],
            )));
  }

  void initBannerAd() {

    print("add");

    ad = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4527142871746030/4831346935',
      //'ca-app-pub-4527142871746030/4831346935',
     // 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            print('Ad to load');
            setState(() {
              adLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            print('Ad failed to load: $error');
          }
      ),
      request: AdRequest(),
    );

    ad.load();
  }

  set_ad() {
    if(adLoaded)
      {
        return AdWidget(ad: ad);
      }
    else
      {
        return Text("Ad is Loading ....");
      }

  }

}
