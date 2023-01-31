part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  @override
  String toString() => 'Add Todo';
}

class UpdateTodo extends TodoEvent {
  @override
  String toString() => 'Update Todo';
}

class GetTodos extends TodoEvent {
  @override
  String toString() => 'Get Todo';
}

class GetCategories extends TodoEvent {
  @override
  String toString() => 'Get Categories';
}
