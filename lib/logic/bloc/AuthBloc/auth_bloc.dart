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
        emit(AuthFailed("unexpected Error:$e"));
        print("the errore is $e");
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final UserCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);
        final result = await authRepository.loginUser(
            email: event.email, password: event.password);
        if (result) {
          emit(AuthSuccess());
        }
      } on FirebaseAuthException catch (e) {
        String message = "";
        if (e.code == 'user-not-found') {
          message = "this email is not register yet";
        } else if (e.code == 'wrong-password') {
          message = 'the password is not correct';
        } else if (e.code == 'invalid-email') {
          message = 'the email is not correct';
        } else {
          message = "please try again";
        }
        emit(AuthFailed(e.toString()));
        emit(AuthFailed("Unexpected error:$e"));
      }
    });
  }
}
