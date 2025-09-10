part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoadingAuth extends AuthState {}

class SuccessAuth extends AuthState {}

class FailedAuth extends AuthState {
  final String message;
  FailedAuth({required this.message});
}
