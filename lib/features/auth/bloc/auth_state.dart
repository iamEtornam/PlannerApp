part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final String userId;
  const AuthSuccess({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthFailure extends AuthState {
  @override
  List<Object> get props => [];
}
