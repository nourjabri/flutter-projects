import 'package:adminapp/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(Loading());

      try {
        final response = await authService.checkauth(
          event.email,
          event.password,
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response.accessToken);
        await prefs.setString('refresh_token', response.refreshToken);

        emit(SuccessAuth());
        print("Success login");
      } catch (e) {
        emit(FailedAuth(message: "Login failed. Check credentials."));
      }
    });
  }
}
