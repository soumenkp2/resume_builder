import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:resume_builder/ResumeTemplates/Template_6.dart';
import 'package:resume_builder/Screens/info_fillup.dart';
import 'package:resume_builder/UserModels/Education_UserModel.dart';
import 'package:resume_builder/PdfApi/pdf_api.dart';

import '../ CustomResumeWidgets/Language_Widget.dart';
import '../ CustomResumeWidgets/Education_Widget.dart';
import '../ CustomResumeWidgets/Header_Widget.dart';
import '../ResumeTemplates/Resume_temp1.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Skills_Languages_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';

class pdfResumeApi{


   static Future<File> generate(List<Profile_UserModel>? profile_list, List<Education_UserModel>? edu_list,  List<Work_Projects_UserModel>? work_list, List<Work_Projects_UserModel>? project_list, List<Achievements_UserModel>? ach_list, List<Skills_Languages_UserModel>? skill_list, List<Skills_Languages_UserModel>? lang_list, String color, String txt_color, String high_color, int index) async {

     print(color);
     print(txt_color);
     print(high_color);

     final pdf = Document();
     pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.standard,
      margin: EdgeInsets.all(0),
      build: (context) => [
        resume_temp(profile_list,edu_list,work_list,project_list,ach_list,skill_list,lang_list,color,txt_color,high_color,index),
      ],
    ));


    return PdfApi.saveDocument(name: 'my_resume.pdf', pdf: pdf);
  }

  static Widget resume_temp(List<Profile_UserModel>? profile_list, List<Education_UserModel>? edu_list, List<Work_Projects_UserModel>? work_list, List<Work_Projects_UserModel>? project_list,  List<Achievements_UserModel>? ach_list, List<Skills_Languages_UserModel>? skill_list, List<Skills_Languages_UserModel>? lang_list,String color, String txt_color, String high_color, int index)
  => set_template(profile_list, edu_list, work_list, project_list, ach_list, skill_list, lang_list, color, txt_color, high_color, index);
}


Widget set_template(List<Profile_UserModel>? profile_list, List<Education_UserModel>? edu_list, List<Work_Projects_UserModel>? work_list, List<Work_Projects_UserModel>? project_list,  List<Achievements_UserModel>? ach_list, List<Skills_Languages_UserModel>? skill_list, List<Skills_Languages_UserModel>? lang_list,String color, String txt_color, String high_color, int index)
{
  if(index == 1 || index==2 || index == 3 || index ==4)
    {
      return Template_1(profile_list, edu_list, work_list, project_list, ach_list, skill_list, lang_list, color, txt_color, high_color);
    }
  else if(index == 5 || index==6)
    {
      return Template_3(profile_list, edu_list, work_list, project_list, ach_list, skill_list, lang_list, color, txt_color, high_color);

    }
  else
    {
      return Text("Invalid Response!!");
    }

}





bool check_visibility_work_project(List<Work_Projects_UserModel>? list) {
  bool check = true;
  if(list ==null) check =false;
  list?.forEach((value) {
    if (value.tableName == null || value.organization_name == null ||
        value.qualification_name == null || value.year_duration == null && value.brief == null) {
      check = false;
    }
    else {
      check = true;
    }
  });

  return check;
}

bool check_visibility_skills_lang(List<Skills_Languages_UserModel>? list) {
  bool check = true;
  if(list ==null) check =false;
  list?.forEach((value) {
    if(value.tableName==null||value.value == null)
    {
      check = false;
    }
    else
      {
        check = true;
      }
  });

  return check;
}

bool check_visibility_education(List<Education_UserModel>? list) {
  bool check = true;
  if(list ==null) check =false;
  list?.forEach((value) {
    if (value.tableName == null || value.organization_name == null ||
        value.qualification_name == null || value.year_duration == null) {
      check = false;
    }
    else {
      check = true;
    }
  });

  return check;
}

bool check_visibility_achievement(List<Achievements_UserModel>? list) {
  bool check = true;
  if(list ==null) check =false;
  list?.forEach((value) {
    if(value.tableName==null||value.organization_name == null || value.qualification_name==null)
    {
      check = false;
    }
    else
      {
        check = true;
      }
  });

  return check;
}



List<Widget> createRow_1(List<Education_UserModel>? edu_list, List<Work_Projects_UserModel>? work_list,  List<Skills_Languages_UserModel>? lang_list,String color, String txt_color, String high_color)
{
  List<Widget> row1 = [];
  if(row1.isEmpty)
    {
      if(check_visibility_education(edu_list!)==true)
      {
        row1.add(pdf_education(edu_list,color,txt_color,high_color));

      }
      if(check_visibility_work_project(work_list!)==true)
      {
        row1.add(pdf_project_work(work_list, color, txt_color, high_color, "Work Experience"));
      }
      if(check_visibility_skills_lang(lang_list!)==true)
      {
        row1.add(pdf_skill_lang(lang_list, color, txt_color, high_color, "Languages"));
      }
    }
  else
    {

    }

  return row1;
}

List<Widget> createRow_2(List<Achievements_UserModel>? ach_list, List<Work_Projects_UserModel>? project_list,  List<Skills_Languages_UserModel>? skill_list,String color, String txt_color, String high_color)
{
  List<Widget> row2 = [];
  if(row2.isEmpty)
  {
    if(check_visibility_achievement(ach_list!)==true)
    {
      row2.add(pdf_achievement(ach_list, color, txt_color, high_color),);
    }
    if(check_visibility_work_project(project_list!)==true)
    {
      row2.add( pdf_project_work(project_list, color, txt_color, high_color, "Projects"),);
    }
    if(check_visibility_skills_lang(skill_list!)==true)
    {
      row2.add(pdf_skill_lang(skill_list, color, txt_color, high_color, "Skills"));
    }
  }
  else
  {

  }

  return row2;
}


Widget Template_1(List<Profile_UserModel>? profile_list, List<Education_UserModel>? edu_list, List<Work_Projects_UserModel>? work_list, List<Work_Projects_UserModel>? project_list,  List<Achievements_UserModel>? ach_list, List<Skills_Languages_UserModel>? skill_list, List<Skills_Languages_UserModel>? lang_list,String color, String txt_color, String high_color)
{
  return Column(
    children: <Widget>[
      pdf_headers(profile_list, high_color),

      // new Padding(padding: const EdgeInsets.all(10),
      //     child: new Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           pdf_education(edu_list,color,txt_color,high_color),
      //           pdf_achievement(ach_list, color, txt_color, high_color),
      //         ])
      // ),
      //
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: new Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           pdf_project_work(work_list, color, txt_color, high_color, "Work Experience"),
      //           pdf_project_work(project_list, color, txt_color, high_color, "Projects"),
      //         ])
      // ),
      //
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: new Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           pdf_skill_lang(lang_list, color, txt_color, high_color, "Languages"),
      //           pdf_skill_lang(skill_list, color, txt_color, high_color, "Skills"),
      //         ])
      // ),

      new Padding(padding: const EdgeInsets.all(10),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                new Flexible(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: createRow_1(edu_list,work_list,lang_list,color,txt_color,high_color),

                    // <Widget>[
                    //   createRow_1()
                    //   // pdf_education(edu_list,color,txt_color,high_color),
                    //   // pdf_project_work(work_list, color, txt_color, high_color, "Work Experience"),
                    //   // pdf_skill_lang(lang_list, color, txt_color, high_color, "Languages"),
                    //
                    // ]
                )),

                new Flexible(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: createRow_2(ach_list, project_list, skill_list, color, txt_color, high_color),
                    // <Widget>[
                    //   pdf_achievement(ach_list, color, txt_color, high_color),
                    //   pdf_project_work(project_list, color, txt_color, high_color, "Projects"),
                    //   pdf_skill_lang(skill_list, color, txt_color, high_color, "Skills"),
                    //
                    // ]
                )),

              ]
          )

      )


    ],

  );
}

Widget Template_3(List<Profile_UserModel>? profile_list, List<Education_UserModel>? edu_list, List<Work_Projects_UserModel>? work_list, List<Work_Projects_UserModel>? project_list,  List<Achievements_UserModel>? ach_list, List<Skills_Languages_UserModel>? skill_list, List<Skills_Languages_UserModel>? lang_list,String color, String txt_color, String high_color)
{
  return Column(
    children: <Widget>[
      pdf_headers(profile_list, high_color),

      new Padding(padding: const EdgeInsets.all(10),
        child: new Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: createRow_1(edu_list,work_list,lang_list,color,txt_color,high_color),
             )),

      new Padding(padding: const EdgeInsets.all(10),
          child: new Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: createRow_2(ach_list, project_list, skill_list, color, txt_color, high_color),
)),


      // new Flexible(child: new Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: createRow_1(edu_list,work_list,lang_list,color,txt_color,high_color),
      // )),
      //
      // new Flexible(child: new Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: createRow_2(ach_list, project_list, skill_list, color, txt_color, high_color),
      // )),


      // new Padding(padding: const EdgeInsets.all(10),
      //   child: pdf_education(edu_list,color,txt_color,high_color),
      // ),
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: pdf_project_work(work_list, color, txt_color, high_color, "Work Experience"),
      // ),
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: pdf_achievement(ach_list, color, txt_color, high_color),
      // ),
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: pdf_project_work(project_list, color, txt_color, high_color, "Projects"),
      // ),
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: pdf_skill_lang(skill_list, color, txt_color, high_color, "Skills"),
      // ),
      // new Padding(padding: const EdgeInsets.all(10),
      //     child: pdf_skill_lang(lang_list, color, txt_color, high_color, "Languages"),
      // ),


    ],

  );
}


//PDF SKILL LANGUAGES CUSTOM WIDGET POWER SET
Widget pdf_skill_lang(List<Skills_Languages_UserModel>? skilang_list, String? color, String txt_color, String high_color, String? categ)
{
  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      alignment: Alignment.topLeft,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Container(
              width: double.infinity,
              child: new Text(categ!,
                style: pw.TextStyle(
                  fontSize: 20,
                  color: set_color(txt_color),
                  fontWeight: pw.FontWeight.bold,
                  fontBold: Font.timesBold(),
                ),
              ),
              color: set_color(color),
            ),

            new Divider(
              color: PdfColors.black,
              thickness: 3,
            ),

            new Align(
              alignment: Alignment.topLeft,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(children: <Widget>[
                      skilangs(index,skilang_list,high_color,color),
                    ]);
                  },
                  separatorBuilder: (context, index) => new SizedBox.shrink(),
                  itemCount: skilang_list!.length)
            )






          ]
      )

  );
}

skilangs(int index, List<Skills_Languages_UserModel>? skilang_list, String? high_color,String? color) {
  return skilang_details(skilang_list?.elementAt(index).value,high_color,color);
}

Widget skilang_details(String? value, String? high_color, String? color)
{


  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: Container(
        child:
            new Padding(padding: const EdgeInsets.all(5), child:new Text(value!,
              textAlign: TextAlign.center,
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColors.white,
                fontWeight: pw.FontWeight.bold,
                fontBold: Font.times(),
              ),
            ),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: set_color(high_color!),
          boxShadow: [
            BoxShadow(color: PdfColors.white, spreadRadius: 3),
          ],
        ),

      )


  );


}
//TERMINATION SKILLS LANGUAGES CUSTOM WIDGET




//PDF ACHIEVEMENT CUSTOM WIDGET POWER SET
Widget pdf_achievement(List<Achievements_UserModel>? ach_list, String? color, String txt_color, String high_color)
{
  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      alignment: Alignment.topLeft,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Container(
              width: double.infinity,
              child: new Text("Achievements",
                style: pw.TextStyle(
                  fontSize: 20,
                  color: set_color(txt_color),
                  fontWeight: pw.FontWeight.bold,
                  fontBold: Font.timesBold(),
                ),
              ),
              color: set_color(color),
            ),

            new Divider(
              color: PdfColors.black,
              thickness: 3,
            ),

            ListView.separated(
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    achs(index,ach_list,high_color),
                  ]);
                },
                separatorBuilder: (context, index) => new SizedBox.shrink(),
                itemCount: ach_list!.length)





          ]
      )

  );
}

achs(int index, List<Achievements_UserModel>? ach_list, String? high_color) {
  return ach_details(ach_list?.elementAt(index).qualification_name,ach_list?.elementAt(index).organization_name,high_color);
}

Widget ach_details(String? course_name, String? org_name, String? high_color)
{


  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Text(course_name!,
              style: pw.TextStyle(
                fontSize: 15,
                color: PdfColors.black,
                fontWeight: pw.FontWeight.bold,
                fontBold: Font.timesBold(),
              ),
            ),

            new Text(org_name!,
              style: pw.TextStyle(
                fontSize: 15,
                color: set_color(high_color),
                fontWeight: pw.FontWeight.bold,
                fontBold: Font.timesBold(),
              ),
            ),

            new Divider(
              color: PdfColors.black,
            ),

          ]));

}
//TERMINATION ACHIEVEMENT CUSTOM WIDGET



//PDF WORK PROJECT CUSTOM WIDGET
Widget pdf_project_work(List<Work_Projects_UserModel>? prowork_list, String? color, String txt_color, String high_color, String categ_name)
{
  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      alignment: Alignment.topLeft,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Container(
              child: new Text(categ_name,
                style: pw.TextStyle(
                  fontSize: 20,
                  color: set_color(txt_color),
                  fontWeight: pw.FontWeight.bold,
                  fontBold: Font.timesBold(),
                ),
              ),
              color: set_color(color),
            ),

            new Divider(
              color: PdfColors.black,
              thickness: 3,
            ),

            ListView.separated(
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    projects_works(index,prowork_list,high_color),
                  ]);
                },
                separatorBuilder: (context, index) => new SizedBox.shrink(),
                itemCount: prowork_list!.length)





          ]
      )

  );
}

projects_works(int index, List<Work_Projects_UserModel>? prowork_list, String? high_color) {
  return prowork_details(prowork_list?.elementAt(index).qualification_name,prowork_list?.elementAt(index).organization_name,prowork_list?.elementAt(index).brief,prowork_list?.elementAt(index).year_duration,high_color);
}

Widget prowork_details(String? course_name, String? org_name, String? brief, String? year, String? high_color)
{


  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Text(course_name!,
              style: pw.TextStyle(
                fontSize: 15,
                color: PdfColors.black,
                fontWeight: pw.FontWeight.bold,
                fontBold: Font.timesBold(),
              ),
            ),

            new Text(org_name!,
              style: pw.TextStyle(
                fontSize: 15,
                color: set_color(high_color),
                fontWeight: pw.FontWeight.bold,
                fontBold: Font.timesBold(),
              ),
            ),

            new Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: new Text(brief!,
                style: pw.TextStyle(
                  fontSize: 15,
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontBold: Font.times(),
                ),
              ),),

            new Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: new Text(year!,
                style: pw.TextStyle(
                  fontSize: 15,
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                  fontBold: Font.times(),
                ),
              ),),

            new Divider(
              color: PdfColors.black,
            ),

          ]));

}
//TERMINATION OF PDF WORK PROJECT CUSTOM WIDGET POWER SET

//PDF EDUCATION CUSTOM WIDGET POWER SET
Widget pdf_education(List<Education_UserModel>? edu_list, String? color, String txt_color, String high_color)
{
  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
      {
        return PdfColors.black;
      }
  }

  return new Container(
      width: double.infinity,
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    alignment: Alignment.topLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        new Container(
          child: new Text("Education",
            style: pw.TextStyle(
              fontSize: 20,
              color: set_color(txt_color),
              fontWeight: pw.FontWeight.bold,
              fontBold: Font.timesBold(),
            ),
          ),
          color: set_color(color),
        ),

        new Divider(
          color: PdfColors.black,
          thickness: 3,
        ),

        ListView.separated(
            itemBuilder: (context, index) {
              return Column(children: <Widget>[
                courses(index,edu_list,high_color),
              ]);
            },
            separatorBuilder: (context, index) => new SizedBox.shrink(),
            itemCount: edu_list!.length)





      ]
    )

  );
}

courses(int index, List<Education_UserModel>? edu_list, String? high_color) {
  return pdf_course_details(edu_list?.elementAt(index).qualification_name,edu_list?.elementAt(index).organization_name,edu_list?.elementAt(index).year_duration,high_color);
}

Widget pdf_course_details(String? course_name, String? org_name, String? year, String? high_color)
{


  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }

  return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

        new Text(course_name!,
          style: pw.TextStyle(
            fontSize: 15,
            color: PdfColors.black,
            fontWeight: pw.FontWeight.bold,
            fontBold: Font.timesBold(),
          ),
        ),

        new Text(org_name!,
          style: pw.TextStyle(
            fontSize: 15,
            color: set_color(high_color),
            fontWeight: pw.FontWeight.bold,
            fontBold: Font.timesBold(),
          ),
        ),

              new Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: new Text(year!,
                    style: pw.TextStyle(
                      fontSize: 15,
                      color: PdfColors.black,
                      fontWeight: pw.FontWeight.bold,
                      fontBold: Font.times(),
                    ),
                  ),),

                  new Divider(
                    color: PdfColors.black,
                  ),

            ]));





}
//TERMINATION OF PDF CUSTOM WIDGET POWER SET


//PDF HEADER WIDGET
Widget pdf_headers(List<Profile_UserModel>? profile_list, String color)
{
  String? name;
  String? phone_no;
  String? link;
  String? mail;
  String? address;



  PdfColor set_color(String? str)
  {
    if(str == "teal")
    {
      return PdfColors.teal;
    }
    else if(str == "blueGrey")
    {
      return PdfColors.blueGrey;
    }
    else if(str == "brown")
    {
      return PdfColors.brown;
    }
    else if(str == "white")
    {
      return PdfColors.white;
    }
    else if(str == "black")
    {
      return PdfColors.black;
    }
    else
    {
      return PdfColors.black;
    }
  }
  String set_values(String str)
  {
    name = profile_list?.elementAt(0).name!;
    phone_no = profile_list?.elementAt(0).phone_no;
    mail = profile_list?.elementAt(0).mail;
    link = profile_list?.elementAt(0).social_link;
    address = profile_list?.elementAt(0).location;

    //print(name);

    if(str=="name")
    {
      return name!;
    }
    else if(str=="phone")
    {
      return phone_no!;
    }
    else if(str == "mail")
    {
      return mail!;
    }
    else if(str == "link")
    {
      return link!;
    }
    else if(str == "address")
    {
      return address!;
    }
    else
    {
      return "";
    }

  }
  

  return new Container(
      height: 150,
      width: double.infinity,
      color: set_color(color),

      child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new Text(set_values("name"),
                  style: pw.TextStyle(
                    fontSize: 30,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold,
                    fontBold: Font.timesBold(),
                  )
              ),
            ),

            new Padding(padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : <Widget>[

                      new Text(set_values("mail"),
                          style: pw.TextStyle(
                            fontSize: 18,
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold,
                            fontBold: Font.times(),

                          )
                      ),

                      new Text(set_values("phone"),
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            fontBold: Font.times(),
                            color: PdfColors.white,

                          )
                      ),

                    ]
                )
            ),

            new Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : <Widget>[

                      new Text(set_values("link"),
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            fontBold: Font.times(),
                            color: PdfColors.white,

                          )
                      ),

                      new Text(set_values("address"),
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontBold: Font.times(),
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,

                          )
                      ),

                    ]
                )
            ),


          ]
      )
  );
}
//TERMINATION OF HEADER WIDGET
