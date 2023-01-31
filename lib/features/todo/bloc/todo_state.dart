part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class SaveSuccess extends TodoState {
  final List<Documents>? todos;
  const SaveSuccess({this.todos});

  @override
  List<Object> get props => [];
}

class SaveFailed extends TodoState {
  @override
  List<Object> get props => [];
}

class SaveCategories extends TodoState {
  final cat.Category? category;
  const SaveCategories({this.category});

  @override
  List<Object> get props => [];
}
