import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/data/repositories/auth_repository.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_event.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final result = await authRepository.registerUser(
            firstName: event.fristName,
            lastName: event.lastName,
            phone: event.phone,
            password: event.password,
            email: event.email);
        if (result) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailed("Registration failed"));
        }
      } catch (e) {
        emit(AuthFailed("unexpected Error:$e"));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        if (event.email == "test@test.com" && event.password == "123456") {
          emit(AuthSuccess());
        } else {
          emit(AuthFailed("mail or password is incorrect"));
        }
      } catch (e) {
        emit(AuthFailed("Unexpected error: $e"));
      }
    });
  }
}
