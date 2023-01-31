import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/features/todo/todo_repository.dart';
import 'package:planner_app/models/category.dart' as cat;
import 'package:planner_app/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodosRepositoryImpl todosRepositoryImpl;
  final Fields todo;
  final String? documentId;
  TodoBloc({this.documentId, required this.todosRepositoryImpl, required this.todo})
      : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is AddTodo) {
        final success = await todosRepositoryImpl.addNewTodo(todo);
        if (success) {
          emit(const SaveSuccess());
        } else {
          emit(SaveFailed());
        }
      } else if (event is UpdateTodo) {
        final success = await todosRepositoryImpl.updateTodo(todo, documentId: documentId!);
        if (success) {
          emit(const SaveSuccess());
        } else {
          emit(SaveFailed());
        }
      } else if (event is GetTodos) {
        final todos = await todosRepositoryImpl.todos();
        if (todos != null || todos!.isNotEmpty) {
          emit(SaveSuccess(todos: todos));
        } else {
          emit(SaveFailed());
        }
      } else if (event is GetCategories) {
        final categories = await todosRepositoryImpl.getCategories();
        if (categories != null) {
          emit(SaveCategories(category: categories));
        } else {
          emit(SaveFailed());
        }
      }
    });
  }
}
