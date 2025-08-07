part of 'authbloc_bloc.dart';

@immutable
abstract class AuthblocEvent {}


class Tryauth extends AuthblocEvent {
  final String email;
  final String password; 
  Tryauth({required this.email, required this.password});
}
 class TryRefreshToken extends AuthblocEvent{}