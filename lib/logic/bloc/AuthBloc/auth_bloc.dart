import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/data/repositories/auth_repository.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_event.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_state.dart';

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
        emit(AuthFailed("Unexpected registration error"));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        final result = await authRepository.loginUser(
            email: event.email, password: event.password);
        if (result) {
          emit(AuthSuccess());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
        } else if (e.code == 'wrong-password') {
        } else if (e.code == 'invalid-email') {
        } else {}
        emit(AuthFailed(e.toString()));
        emit(AuthFailed("Login failed. Please try again."));
      }
    });
  }
}
