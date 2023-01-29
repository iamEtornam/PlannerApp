import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/features/auth/auth_repository.dart';
import 'package:planner_app/features/auth/bloc/auth_bloc.dart';
import 'package:planner_app/features/todo/bloc/todo_bloc.dart';
import 'package:planner_app/features/todo/todo_repository.dart';
import 'package:planner_app/models/todo.dart';
import 'package:planner_app/utils/http_utils.dart';
import 'package:planner_app/views/auth_view.dart';
import 'package:planner_app/views/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            AuthBloc(AuthRepositoryImpl(FirebaseAuth.instance))..add(AuthStarted()),
      ),
      BlocProvider(
        create: (context) =>
            TodoBloc(todosRepositoryImpl: TodosRepositoryImpl(HttpUtils()), todo: Fields()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return MaterialApp(
            title: 'Planner',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TodoView(),
          );
        } else {
          return MaterialApp(
            title: 'Planner',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const AuthView(),
          );
        }
      },
    );
  }
}
