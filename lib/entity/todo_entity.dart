import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  const TodoEntity(this.task, this.id, this.note, this.complete);

  Map<String, dynamic> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  static TodoEntity fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool,
    );
  }

  Map<String, Object> toDocument() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
    };
  }
  
  @override
  List<Object?> get props => [complete, note, task];
}
