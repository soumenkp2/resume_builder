

class Achievements_UserModel {
  String? id;
  String? tableName;
  String? organization_name;
  String? qualification_name;

  //Initialiazing the values
  Achievements_UserModel(
      {this.organization_name,
      this.qualification_name,
      this.tableName,
      this.id});

  //Setting values in map to use it further
  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();

    data["organization_name"] = organization_name!;
    data["qualification_name"] = qualification_name!;
    data["tableName"] = tableName!;
    data["id"] = id!;
    return data;
  }

  Achievements_UserModel.fromDbMap(Map<String, dynamic> map)
      : organization_name = map['organization_name'],
        qualification_name = map['qualification_name'],
        tableName = map['tableName'],
        id = map['id'];
}
