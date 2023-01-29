part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {
  @override
  String toString() => 'Auth LOGOUT';
}
