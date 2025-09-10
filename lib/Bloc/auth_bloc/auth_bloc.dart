import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myerp/repository/repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<Tryauth>((event, emit) async {
      emit(LoadingAuth());
      try {
        final authModel = await repository.checkauth(
          event.email,
          event.password,
        );
        final prefs = await SharedPreferences.getInstance();
         await prefs.setString('access_token', authModel.accessToken);
        await prefs.setString('refresh_token', authModel.refreshToken);
        emit(SuccessAuth());
      } catch (e) {
        emit(FailedAuth(message: "Failed to get token"));
      }
      await Future.delayed(Duration(seconds: 2));
    });
    on<TryRefreshToken>((event, emit) async {
      emit(FailedAuth(message: "refresh token has ended"));

      try {
        await repository.refreshToken();
      } catch (e) {
        FailedAuth(message: "refresh token has end");
      }
    });
  }
}
