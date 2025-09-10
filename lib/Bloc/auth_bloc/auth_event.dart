part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Tryauth extends AuthEvent {
  final String email;
  final String password; 
  Tryauth({required this.email, required this.password});
}
 class TryRefreshToken extends AuthEvent{}