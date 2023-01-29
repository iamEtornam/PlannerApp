import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/features/auth/bloc/auth_bloc.dart';
import 'package:planner_app/features/todo/bloc/todo_bloc.dart';
import 'package:planner_app/views/add_todo_form_view.dart';
import 'package:planner_app/views/auth_view.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, authState) {
              if (authState is AuthFailure && userId != null) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const AuthView()),
                    (Route<dynamic> route) => false);
              } else if (authState is AuthFailure && userId == null) {
                context.read<AuthBloc>().add(AuthStarted());
              }
            },
          ),
          BlocListener<TodoBloc, TodoState>(listener: (context, todoState) {
            if (todoState is SaveSuccess) {
              context.read<TodoBloc>().add(GetTodos());
            }
          })
        ],
        child: Builder(builder: (context) {
   
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const AddTodoFormView()));
              },
              child: const Icon(Icons.add),
            ),
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'March 9, 2020',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => const AuthView()));
                              },
                              child: Image.asset(
                                'assets/user.png',
                                width: 48,
                                height: 48,
                              ),
                            )
                          ],
                        ),
                        Text(
                          '5 incomplete, 5 completed',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                )),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Incomplete',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: Text(
                    'Upload 1099-R to TurboTax',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '💰 Finance',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFFB9B9BE)),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
