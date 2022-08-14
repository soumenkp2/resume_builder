class TableName {
  String? tableName;
  String? id;
  TableName({this.tableName, this.id});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['tableName'] = tableName!;
    data['id'] = id!;
    return data;
  }

  TableName.fromDB(Map<String, dynamic> data)
      : tableName = data['tableName'],
        id = data['id'];
}
