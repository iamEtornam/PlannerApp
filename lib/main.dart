import 'package:flutter/material.dart';
import 'package:planner_app/views/todo_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoView(),
    );
  }
}
