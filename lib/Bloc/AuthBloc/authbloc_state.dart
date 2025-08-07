part of 'authbloc_bloc.dart';

@immutable
abstract class AuthblocState {}

class AuthblocInitial extends AuthblocState {}

class LoadingAuth extends AuthblocState {}

class SuccessAuth extends AuthblocState {}

class FailedAuth extends AuthblocState {
  final String message;
  FailedAuth({required this.message});
}
