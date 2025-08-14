part of 'registerbloc_bloc.dart';

@immutable
sealed class RegisterState {}

final class StudentInitial extends RegisterState {}

class StudentLoading extends RegisterState {}

class SuccessCreateStudent extends RegisterState {}

class FailedCreateStudnet extends RegisterState {
  final String message;
  FailedCreateStudnet({required this.message});
}

class Error extends RegisterState {
  final String message;
  Error({required this.message});
}

class StudnetLoadedSuccess extends RegisterState {
  final List<Studentmodel> Studnets;
  StudnetLoadedSuccess({required this.Studnets});
}

class NoFitchStudents extends RegisterState {
  final String messages;
  NoFitchStudents({required this.messages});
}
