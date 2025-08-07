import 'dart:async';

import 'package:audioapp/repo/authRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthblocInitial()) {
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

