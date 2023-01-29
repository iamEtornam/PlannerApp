import 'dart:async';

import 'package:planner_app/models/todo.dart';
import 'package:planner_app/utils/http_utils.dart';

abstract class TodosRepository {
  Future<bool> addNewTodo(Fields todo);
  Future<List<Documents>?> todos();
  Future<bool> updateTodo(Fields todo, {required String documentId});
}

class TodosRepositoryImpl implements TodosRepository {
  final HttpUtils httpUtils;

  TodosRepositoryImpl(this.httpUtils);

  @override
  Future<bool> addNewTodo(Fields todo) async {
    final data = await httpUtils.postData(path: '/tasks', data: todo.toJson());
    if (data != null) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Documents>?> todos() async {
    final data = await httpUtils.getData(path: '/tasks');
    if (data != null) {
      final todo = Todo.fromJson(data);
      return todo.documents ?? [];
    }
    return [];
  }

  @override
  Future<bool> updateTodo(Fields update, {required String documentId}) async {
    final data = await httpUtils.patchData(path: '/tasks/$documentId', data: update.toJson());
    if (data != null) {
      return true;
    }
    return false;
  }
}
