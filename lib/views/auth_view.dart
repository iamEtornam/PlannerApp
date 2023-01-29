import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/features/auth/bloc/auth_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Login with your google\naccount to save your tasks.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          const Spacer(),
          Center(
            child: TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthStarted());
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/google.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 34,
                      ),
                      Text(
                        'Sign in with Google',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
