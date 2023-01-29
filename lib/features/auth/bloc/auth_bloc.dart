import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/features/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl _authRepositoryImpl;

  AuthBloc(this._authRepositoryImpl) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthStarted) {
        final userId = await _authRepositoryImpl.mergeAuth();
        if (userId != null) {
          emit(AuthSuccess(userId: userId));
        } else {
          emit(AuthFailure());
        }
      } else if (event is AuthLogout) {
        await _authRepositoryImpl.logout();
        emit(AuthFailure());
      
      }
    });
  }
}
