import 'package:flutter/material.dart';
import 'package:resume_builder/DataBase/DataBaseManager.dart';

import 'package:resume_builder/Screens/edit_form_fillup.dart';
import 'package:resume_builder/Screens/home.dart';
import 'package:resume_builder/Screens/main_screen.dart';
//import 'package:resume_builder/Screens/info_fillup.dart';
import 'package:resume_builder/UserModels/Achievements_UserModel.dart';
import 'package:resume_builder/UserModels/Education_UserModel.dart';
import 'package:resume_builder/UserModels/Skills_Languages_UserModel.dart';
import 'package:resume_builder/UserModels/Work_Projects_UserModel.dart';

import '../DataBase/TableName.dart';
import '../ResumeTemplates/Resume_temp2.dart';
import '../ResumeTemplates/Template_1.dart';
import '../ResumeTemplates/Template_2.dart';
import '../ResumeTemplates/Template_3.dart';
import '../ResumeTemplates/Template_4.dart';
import '../ResumeTemplates/Template_5.dart';
import '../ResumeTemplates/Template_6.dart';
import '../UserModels/Profile_UserModel.dart';
import 'info_fillup.dart';

class FormListPage extends StatefulWidget {
  int tableIndex;

  FormListPage({required this.tableIndex});

  @override
  State<FormListPage> createState() => _FormListPageState();
}

class _FormListPageState extends State<FormListPage> {
  List<TableName>? _tableName = [];
  List<Work_Projects_UserModel>? _workTable = [];
  List<Work_Projects_UserModel>? _projectTable = [];
  List<Skills_Languages_UserModel>? _skillTable = [];
  List<Skills_Languages_UserModel>? _languageTable = [];
  List<Profile_UserModel>? _profileTable = [];
  List<Achievements_UserModel>? _achievementTable = [];
  List<Education_UserModel>? _educationTable = [];
  bool _isLoading = true;
  bool _isDataLoading = true;
  late Future<List<TableName>?> list;

  // This function is used to fetch all data from the database
  _getTableName() async {
    final data = await DataBaseManager.instance.queryTableData();
    setState(() {
      _tableName = data;
    });
    return _tableName;
  }

  Future<void> _getDataBase(String tableName) async {
    final data = await DataBaseManager.instance.queryAchievementData(tableName);
    final data1 = await DataBaseManager.instance.queryEduData(tableName);
    final data2 = await DataBaseManager.instance.queryLanguageData(tableName);
    final data3 = await DataBaseManager.instance.queryProfileData(tableName);
    final data4 = await DataBaseManager.instance.queryProjectData(tableName);
    final data5 = await DataBaseManager.instance.querySkillsData(tableName);
    final data6 = await DataBaseManager.instance.queryWorkData(tableName);
    setState(() {
      _achievementTable = data;
      _educationTable = data1;
      _languageTable = data2;
      _profileTable = data3;
      _projectTable = data4;
      _skillTable = data5;
      _workTable = data6;
      _isDataLoading = false;
    });
  }

  @override
  void initState() {
    _getTableName();
    list = DataBaseManager.instance.queryTableData();
    super.initState();


    print("\n\nEducation");
    _educationTable?.forEach((element) {
      print(element.qualification_name);
      print(element.organization_name);
      print(element.year_duration);
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  ()async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          main_screen() ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Name'),
        ),
        body: FutureBuilder<List<TableName>?>(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white12,
                        margin: const EdgeInsets.all(15),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 20.0),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: ()async{
                                            await _getDataBase(
                                                _tableName
                                                    ?.elementAt(index!)
                                                    .tableName ?? 'NO LIST');
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>
                                                    Next_to_dynamic_resume(context, widget.tableIndex))) ;
                                          },
                                          child: Text(
                                            _tableName
                                                ?.elementAt(index!)
                                                .tableName ?? 'NO LIST',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  InkWell(
                                    onTap: ()async{

                                      await _getDataBase(
                                          _tableName
                                              ?.elementAt(index!)
                                              .tableName ?? 'NO LIST');
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              edit_form_fillup(  _tableName
                                                  ?.elementAt(index!)
                                                  .tableName ?? 'NO LIST',widget.tableIndex, _educationTable, _projectTable, _skillTable, _languageTable, _workTable, _achievementTable, _profileTable)))
                                          .then((_) async {
                                        setState(() {
                                          list = DataBaseManager.instance.queryTableData();
                                          _getTableName();
                                        });
                                      });


                                    },
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[200],
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.edit, color: Colors.orange[800]),
                                    ),
                                  ),


                                  SizedBox(width: 20.0),
                                  InkWell(
                                    onTap: ()async{
                                    DataBaseManager.instance.delete(  _tableName
                                        ?.elementAt(index!)
                                        .tableName ?? 'NO LIST').then((_) async {
                                      setState(() {
                                        list = DataBaseManager.instance.queryTableData();
                                        _getTableName();
                                      });
                                    });
                                    },
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[200],
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.delete, color: Colors.red[400]),
                                    ),
                                  ),


                                ],
                              ),
                            ),

                          ],
                        ),


                      );
                    });
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: list,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_form_fillup(widget.tableIndex, _educationTable, _projectTable, _skillTable, _languageTable, _workTable, _achievementTable, _profileTable)));
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => info_fillup(1)));

            Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (builder) => info_fillup(widget.tableIndex)))
                .then((_) async {
              setState(() {
                list = DataBaseManager.instance.queryTableData();
                _getTableName();
              });
            });
          },
        ),
      ),
    );
  }



  Widget Next_to_dynamic_resume(BuildContext context, int index) {

    print("form: ");
    print(index);


    if (index == 1) {
      return Template_1( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);

    } else if (index == 2) {
      return Template_2( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);


    } else if (index == 3) {
      return Template_3( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);


    } else if (index == 4) {
      return Template_4( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);

    } else if (index == 6) {
      return Template_6( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);

    } else if (index == 5) {
      return Template_5( _educationTable,_workTable, _projectTable, _profileTable, _achievementTable, _skillTable, _languageTable);

    } else {
      return Text("hello ji");
    }
  }
}
