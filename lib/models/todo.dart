class Todo {
  List<Documents>? documents;

  Todo({this.documents});

  Todo.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  Documents({this.name, this.fields, this.createTime, this.updateTime});

  Documents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class Fields {
  Date? date;
  CategoryId? categoryId;
  CategoryId? name;
  IsCompleted? isCompleted;

  Fields({this.date, this.categoryId, this.name, this.isCompleted});

  Fields.fromJson(Map<String, dynamic> json) {
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    categoryId = json['categoryId'] != null ? CategoryId.fromJson(json['categoryId']) : null;
    name = json['name'] != null ? CategoryId.fromJson(json['name']) : null;
    isCompleted = json['isCompleted'] != null ? IsCompleted.fromJson(json['isCompleted']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (categoryId != null) {
      data['categoryId'] = categoryId!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (isCompleted != null) {
      data['isCompleted'] = isCompleted!.toJson();
    }
    return data;
  }
}

class Date {
  String? integerValue;

  Date({this.integerValue});

  Date.fromJson(Map<String, dynamic> json) {
    integerValue = json['integerValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['integerValue'] = integerValue;
    return data;
  }
}

class CategoryId {
  String? stringValue;

  CategoryId({this.stringValue});

  CategoryId.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

class IsCompleted {
  bool? booleanValue;

  IsCompleted({this.booleanValue});

  IsCompleted.fromJson(Map<String, dynamic> json) {
    booleanValue = json['booleanValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booleanValue'] = booleanValue;
    return data;
  }
}
