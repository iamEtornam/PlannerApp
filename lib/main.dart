import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/views/auth_view.dart';
import 'package:planner_app/views/todo_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && snapshot.data == null) {
            return MaterialApp(
              title: 'Planner',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (snapshot.data == null) {
            return MaterialApp(
              title: 'Planner',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const AuthView(),
            );
          }
          return MaterialApp(
            title: 'Planner',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TodoView(),
          );
        });
  }
}
