import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Screens/your_resume.dart';
import 'package:resume_builder/UserModels/Skills_Languages_UserModel.dart';

import '../ResumeTemplates/Resume_temp1.dart';
import '../UserModels/Achievements_UserModel.dart';
import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';
import 'dart:developer';

class info_fillup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => info_fillup_state();
}

String? category_head_name;
List<Education_UserModel>? edu_list;
List<Work_Projects_UserModel>? work_list;
List<Work_Projects_UserModel>? project_list;
List<Skills_Languages_UserModel>? skill_list;
List<Achievements_UserModel>? achievement_list;
List<Profile_UserModel>? profile_list;

Map<String,List>? final_data;
bool? send_flag;

Map<String, bool>? categories;

class info_fillup_state extends State<info_fillup> {
  @override
  void initState() {
    super.initState();
    edu_list = new List<Education_UserModel>.empty(growable: true);
    work_list = new List<Work_Projects_UserModel>.empty(growable: true);
    project_list = new List<Work_Projects_UserModel>.empty(growable: true);
    skill_list = new List<Skills_Languages_UserModel>.empty(growable: true);
    achievement_list = new List<Achievements_UserModel>.empty(growable: true);
    profile_list = new List<Profile_UserModel>.empty(growable: true);

    categories = new Map<String, bool>();
    categories!["Education"] = true;
    categories!["Achievements"] = false;
    categories!["Languages and Skills"] = false;
    categories!["Projects"] = false;
    categories!["Work"] = false;
    categories!["Profile"] = false;

    category_head_name = "Education";

    edu_list?.add(new Education_UserModel());
    achievement_list?.add(new Achievements_UserModel());
    work_list?.add(new Work_Projects_UserModel());
    project_list?.add(new Work_Projects_UserModel());
    skill_list?.add(new Skills_Languages_UserModel());
    profile_list?.add(new Profile_UserModel());

    final_data = new Map<String,List>();
    final_data!["Education_details"] = edu_list!;
    final_data!["Achievement_details"] = achievement_list!;
    final_data!["Project_details"] = project_list!;
    final_data!["Skill_details"] = skill_list!;
    final_data!["Work_details"] = work_list!;
    final_data!["Profile_details"] = profile_list!;
    send_flag = false;



  }

  void add_card(String category_name)
  {
    setState(()
    {
      if(category_name == "Education")
        {
          if(edu_list!.length >1)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
            {
              edu_list?.add(new Education_UserModel());
            }

        }
      else if(category_name == "Achievements")
        {
          if(achievement_list!.length >1)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
          {
            achievement_list?.add(new Achievements_UserModel());
          }
        }
      else if(category_name == "Work")
        {
          if(work_list!.length >1)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
          {
            work_list?.add(new Work_Projects_UserModel());
          }
        }
      else if(category_name == "Projects")
        {
          if(project_list!.length >1)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
          {
            project_list?.add(new Work_Projects_UserModel());
          }
        }
      else if(category_name == "Languages and Skills")
        {
          if(skill_list!.length >1)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
          {
            skill_list?.add(new Skills_Languages_UserModel());
          }
        }
      else if(category_name == "Profile")
        {
          if(profile_list!.length >=0)
          {
            var snackBar = SnackBar(content: Text('Max Limit Reached'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else
          {
            profile_list?.add(new Profile_UserModel());
          }
        }
      else
        {
          var snackBar = SnackBar(content: Text('Unwanted Behaviour Noticed'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

    });
  }

  void delete_card(String category_name)
  {
    setState(()
    {
      if(category_name == "Education")
      {
        if(edu_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          edu_list?.removeLast();
        }

      }
      else if(category_name == "Achievements")
      {
        if(achievement_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          achievement_list?.removeLast();
        }
      }
      else if(category_name == "Work")
      {
        if(work_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          work_list?.removeLast();
        }
      }
      else if(category_name == "Projects")
      {
        if(project_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          project_list?.removeLast();
        }
      }
      else if(category_name == "Languages and Skills")
      {
        if(skill_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          skill_list?.removeLast();
        }
      }
      else if(category_name == "Profile")
      {
        if(profile_list!.length <=1)
        {
          var snackBar = SnackBar(content: Text('Min Limit Reached'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else
        {
          profile_list?.removeLast();
        }
      }
      else
      {
        var snackBar = SnackBar(content: Text('Unwanted Behaviour Noticed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    });
  }

  void category_observation(String category_name) {
    setState(() {
      categories?.forEach((key, value) {
        if (key == category_name) {
          category_head_name = category_name;
          categories![key] = true;
        } else {
          categories![key] = false;
        }
      });



      print("\n\nProfile");
      profile_list?.forEach((element) {
        print(element.name);
        print(element.phone_no);
        print(element.mail);
        print(element.location);
        print(element.social_link);

      });

      print("\n\nEducation");
      edu_list?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
      });

      print("\n\nProjects");
      project_list?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
        print(element.brief);
      });

      print("\n\nWork");
      work_list?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
        print(element.year_duration);
        print(element.brief);
      });

      print("\n\nAchievements");
      achievement_list?.forEach((element) {
        print(element.qualification_name);
        print(element.organization_name);
      });

      print("\n\nSkills");
      skill_list?.forEach((element) {
        print(element.value);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new SingleChildScrollView(
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new InkWell(
                    onTap: () {
                      category_observation("Education");
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(color: Colors.teal, spreadRadius: 2),
                          ],
                        ),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: new Padding(
                            padding: const EdgeInsets.all(10),
                            child: new Image.asset(
                              'assets/images/education.png',
                              //height: 15.0,
                              fit: BoxFit.cover,
                            )))),
                new InkWell(
                  onTap: () {
                    category_observation("Languages and Skills");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, spreadRadius: 2),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Padding(
                        padding: const EdgeInsets.all(10),
                        child: new Image.asset(
                          'assets/images/skill.png',
                          //height: 15.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                new InkWell(
                  onTap: () {
                    category_observation("Achievements");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, spreadRadius: 2),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Padding(
                          padding: const EdgeInsets.all(10),
                          child: new Image.asset(
                            'assets/images/trophy.png',
                            // height: 35.0,
                            // fit: BoxFit.cover,
                          ))),
                ),
                new InkWell(
                  onTap: () {
                    category_observation("Work");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, spreadRadius: 2),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Padding(
                        padding: const EdgeInsets.all(10),
                        child: new Image.asset(
                          'assets/images/work_experience.png',
                          //height: 15.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                new InkWell(
                  onTap: () {
                    category_observation("Profile");
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, spreadRadius: 2),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Padding(
                        padding: const EdgeInsets.all(10),
                        child: new Image.asset(
                          'assets/images/profile.png',
                          //height: 15.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                new InkWell(
                  onTap: () {
                    category_observation("Projects");
                  },
                  child: new Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.teal, spreadRadius: 2),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Padding(
                        padding: const EdgeInsets.all(10),
                        child: new Image.asset(
                          'assets/images/projects.png',
                          //height: 15.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
        //Termination of Categories

        new Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 80, 0),
                child: new Text(category_head_name!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
              ),
              new InkWell(
                onTap: (){add_card(category_head_name!);},
                child: new Padding(
                padding: const EdgeInsets.all(10),
                child: new Image.asset(
                'assets/images/addbtn.png',
                height: 35.0,
                // fit: BoxFit.cover,
                )),
                ),
                new InkWell(
                onTap: (){delete_card(category_head_name!);},
                child: new Visibility(
                visible: true,
                child: new Padding(
                padding: const EdgeInsets.all(10),
                child: new Image.asset(
                'assets/images/minusbtn.png',
                height: 35.0,
                // fit: BoxFit.cover,
                )),
                ),
                )

                ])),

                new Divider(
          color: Colors.black,
          thickness: 3,
        ),

        new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //current_category()
              //current_category(),

              ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(children: <Widget>[
                      current_category(index),
                    ]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: list_len())
            ]),

        new Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child:
            ElevatedButton(
              onPressed: () {
                //edu_data_upload(context);
              },
              child: Text('Next',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))
              ),
            )

        ),


        //current_category(),
      ],
    )));
  }


}

int list_len()
{
  if (categories!["Education"] == true) {
    return edu_list!.length;
  } else if (categories!["Achievements"] == true) {
    return achievement_list!.length;
  } else if (categories!["Profile"] == true) {
    return profile_list!.length;
  } else if (categories!["Work"] == true) {
    return work_list!.length;
  } else if (categories!["Projects"] == true) {
    return project_list!.length;
  } else if (categories!["Languages and Skills"] == true) {
    return skill_list!.length;
  }
  else
    {
      return 0;
    }
}


Widget current_category(int index) {
  if (categories!["Education"] == true) {
    return Education_fillup_widget(index: index);
  } else if (categories!["Achievements"] == true) {
    return Achievement_fillup_widget(index: index);
  } else if (categories!["Profile"] == true) {
    return Profile_fillup_widget(index: index,);
  } else if (categories!["Work"] == true) {
    return Work_fillup_widget(index: index);
  } else if (categories!["Projects"] == true) {
    return Project_fillup_widget(index: index);
  } else if (categories!["Languages and Skills"] == true) {
    return Skill_fillup_widget(index: index);
  } else {
    return Text("Invalid Widget");
  }
}



class Profile_fillup_widget extends StatelessWidget {

  int? index;
  String? name;
  String? phone_no;
  String? location;
  String? link;
  String? mail;

  Profile_fillup_widget({
    this.index,
});


  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
        // width: 50,
        // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list?.elementAt(index!).name,
                    onChanged: (text) => name=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your name',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list?.elementAt(index!).phone_no,
                    onChanged: (text) => phone_no=text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter phone no',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list?.elementAt(index!).location,
                    onChanged: (text) => location=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter address',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list?.elementAt(index!).mail,
                    onChanged: (text) => mail=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter mail id',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: profile_list?.elementAt(index!).social_link,
                    onChanged: (text) => link=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter social media link',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child:
                  ElevatedButton(
                    onPressed: () {
                       profile_data_upload(context);
                    },
                    child: Text('Save'),
                  )

                  ),
              ])),


    );
  }

  void profile_data_upload(BuildContext context)
  {
    if(name==null)
     {
       name = profile_list?.elementAt(index!).name;
     }
    if(location==null)
      {
        location = profile_list?.elementAt(index!).location;
      }
    if(mail==null)
      {
        mail= profile_list?.elementAt(index!).mail;
      }
    if(phone_no==null)
      {
        phone_no= profile_list?.elementAt(index!).phone_no;
      }
    if(link==null )
      {
        link = profile_list?.elementAt(index!).social_link;
      }


    if(name!.isEmpty || location!.isEmpty || phone_no!.isEmpty || mail!.isEmpty || link!.isEmpty || name==null || location==null || phone_no==null || link==null || mail==null)
      {
        var snackBar = SnackBar(content: Text('data not filled'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    else if(name!.isNotEmpty && location!.isNotEmpty && phone_no!.isNotEmpty && mail!.isNotEmpty && link!.isNotEmpty && name!=null && location!=null && phone_no!=null && link!=null && mail!=null)
      {
        profile_list?.elementAt(index!).name = name;
        profile_list?.elementAt(index!).location = location;
        profile_list?.elementAt(index!).mail = mail;
        profile_list?.elementAt(index!).social_link = link;
        profile_list?.elementAt(index!).phone_no = phone_no;

        var snackBar = SnackBar(content: Text('data filled'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    else
      {
        var snackBar = SnackBar(content: Text('data not filled'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

  }


}


class Project_fillup_widget extends StatelessWidget {

  int? index;
  String? project_name;
  String? project_brief;
  String? project_type;
  String? project_duration;

  Project_fillup_widget({
    this.index
  });


  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
        // width: 50,
        // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list?.elementAt(index!).qualification_name,
                    onChanged: (text) => project_name =text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter project name',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list?.elementAt(index!).organization_name,
                    onChanged: (text) => project_type =text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Project type - Group/Self',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list?.elementAt(index!).brief,
                    onChanged: (text) => project_brief=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Brief your project',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: project_list?.elementAt(index!).year_duration,
                    onChanged: (text) => project_duration=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),),),

                new Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        project_data_upload(context);
                      },
                      child: Text('Save'),
                    )

                ),

              ])),

    );
  }

  void project_data_upload(BuildContext context) {

    if(project_name==null)
    {
      project_name = project_list?.elementAt(index!).qualification_name;
    }
    if(project_type==null)
    {
      project_type = project_list?.elementAt(index!).organization_name;
    }
    if(project_brief==null)
    {
      project_brief= project_list?.elementAt(index!).brief;
    }
    if(project_duration==null)
    {
      project_duration= project_list?.elementAt(index!).year_duration;
    }



    if(project_name!.isEmpty || project_type!.isEmpty || project_brief!.isEmpty || project_duration!.isEmpty || project_name==null || project_type==null || project_brief==null || project_duration==null)
    {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(project_name!.isNotEmpty && project_type!.isNotEmpty && project_brief!.isNotEmpty && project_duration!.isNotEmpty && project_name!=null && project_type!=null && project_brief!=null && project_duration!=null)
    {
      project_list?.elementAt(index!).qualification_name = project_name;
      project_list?.elementAt(index!).organization_name = project_type;
      project_list?.elementAt(index!).brief = project_brief;
      project_list?.elementAt(index!).year_duration = project_duration;

      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

}

class Skill_fillup_widget extends StatelessWidget {

  int? index;
  String? skill_name;

  Skill_fillup_widget({
    this.index,
  });


  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
        // width: 50,
        // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: (text) => skill_name=text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    initialValue: skill_list?.elementAt(index!).value,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter skill name',
                    ),
                  ),),

                new Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        skill_data_upload(context);
                      },
                      child: Text('Save'),
                    )

                ),


              ])),

    );
  }

  void skill_data_upload(BuildContext context) {

    if(skill_name==null)
    {
      skill_name = skill_list?.elementAt(index!).value;
    }

    if(skill_name!.isEmpty || skill_name==null)
    {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(skill_name!.isNotEmpty && skill_name!=null)
    {
      skill_list?.elementAt(index!).value = skill_name;

      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }


  }}

class Achievement_fillup_widget extends StatelessWidget {

  int? index;
  String? ach_name;
  String? ach_org;


  Achievement_fillup_widget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
        // width: 50,
        // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: achievement_list?.elementAt(index!).qualification_name,
                    onChanged: (text) => ach_name=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Achievement',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: achievement_list?.elementAt(index!).organization_name,
                    onChanged: (text) => ach_org=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Issued by - ',
                    ),),),

                new Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        achievement_data_upload(context);
                      },
                      child: Text('Save'),
                    )

                ),

              ])),

    );
  }

  void achievement_data_upload(BuildContext context) {

    if(ach_name==null)
    {
      ach_name = achievement_list?.elementAt(index!).qualification_name;
    }
    if(ach_org==null)
    {
      ach_org = achievement_list?.elementAt(index!).organization_name;
    }


    if(ach_name!.isEmpty || ach_org!.isEmpty || ach_name==null || ach_org==null)
    {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(ach_name!.isNotEmpty && ach_org!.isNotEmpty && ach_name!=null && ach_org!=null)
    {
      achievement_list?.elementAt(index!).qualification_name = ach_name;
      achievement_list?.elementAt(index!).organization_name = ach_org;

      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }


  }}

class Work_fillup_widget extends StatelessWidget {

  int? index;
  String? project_name;
  String? project_brief;
  String? project_type;
  String? project_duration;


  Work_fillup_widget({
    this.index,
  });


  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
        // width: 50,
        // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list?.elementAt(index!).qualification_name,
                    onChanged: (text) => project_name=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter work qualification',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list?.elementAt(index!).organization_name,
                    onChanged: (text) => project_type=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter organization name',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list?.elementAt(index!).brief,
                    onChanged: (text) => project_brief=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Brief your work',
                    ),),),

                new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: work_list?.elementAt(index!).year_duration,
                    onChanged: (text) => project_duration=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),),),

                new Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        work_data_upload(context);
                      },
                      child: Text('Save'),
                    )

                ),

              ])),

    );
  }


  void work_data_upload(BuildContext context) {

    if(project_name==null)
    {
      project_name = work_list?.elementAt(index!).qualification_name;
    }
    if(project_type==null)
    {
      project_type = work_list?.elementAt(index!).organization_name;
    }
    if(project_brief==null)
    {
      project_brief= work_list?.elementAt(index!).brief;
    }
    if(project_duration==null)
    {
      project_duration= work_list?.elementAt(index!).year_duration;
    }



    if(project_name!.isEmpty || project_type!.isEmpty || project_brief!.isEmpty || project_duration!.isEmpty || project_name==null || project_type==null || project_brief==null || project_duration==null)
    {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(project_name!.isNotEmpty && project_type!.isNotEmpty && project_brief!.isNotEmpty && project_duration!.isNotEmpty && project_name!=null && project_type!=null && project_brief!=null && project_duration!=null)
    {
      work_list?.elementAt(index!).qualification_name = project_name;
      work_list?.elementAt(index!).organization_name = project_type;
      work_list?.elementAt(index!).brief = project_brief;
      work_list?.elementAt(index!).year_duration = project_duration;

      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

}


class Education_fillup_widget extends StatelessWidget {

  int? index;
  String? edu_name;
  String? edu_org;
  String? edu_duration;

  Education_fillup_widget({
    this.index,
  }) ;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.teal, spreadRadius: 2),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: edu_list?.elementAt(index!).qualification_name,
                    onChanged: (text) => edu_name=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter education qualification',
                    ),),),

                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: edu_list?.elementAt(index!).organization_name,
                    onChanged: (text) => edu_org=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter organization name',
                    ),),),

                new Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    initialValue: edu_list?.elementAt(index!).year_duration,
                    onChanged: (text) => edu_duration=text,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter starting-closing year',
                    ),),),

                new Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child:
                    ElevatedButton(
                      onPressed: () {
                        edu_data_upload(context);
                      },
                      child: Text('Save'),
                    )

                ),
              ])),

    );
  }

  void edu_data_upload(BuildContext context) {

    if(edu_name==null)
    {
      edu_name = edu_list?.elementAt(index!).qualification_name;
    }
    if(edu_org==null)
    {
      edu_org = edu_list?.elementAt(index!).organization_name;
    }
    if(edu_duration==null)
    {
      edu_duration= edu_list?.elementAt(index!).year_duration;
    }



    if(edu_name!.isEmpty || edu_org!.isEmpty || edu_duration!.isEmpty || edu_name==null || edu_org==null || edu_duration==null)
    {
      var snackBar = SnackBar(content: Text('data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(edu_name!.isNotEmpty && edu_org!.isNotEmpty && edu_duration!.isNotEmpty && edu_name!=null && edu_org!=null && edu_duration!=null)
    {
      edu_list?.elementAt(index!).qualification_name = edu_name;
      edu_list?.elementAt(index!).organization_name = edu_org;
      edu_list?.elementAt(index!).year_duration = edu_duration;

      var snackBar = SnackBar(content: Text('Data filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      var snackBar = SnackBar(content: Text('Data not filled'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }


}
