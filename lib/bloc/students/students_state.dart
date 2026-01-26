part of 'students_bloc.dart';

@immutable
sealed class StudentsState {}

class StudentsInitial extends StudentsState {}

class StudentLoading extends StudentsState {}

class SuccessCreateStudents extends StudentsState {}

class FailedCreateStudent extends StudentsState {
  final String message;
  FailedCreateStudent({required this.message});
}

class ErrorStudent extends StudentsState {
  final String message;
  ErrorStudent({required this.message});
}

class SuccessLoadStudents extends StudentsState {
  final List<StudentModel> students;
  SuccessLoadStudents({required this.students});
}

class NoFetchStudent extends StudentsState {
  final String message;
  NoFetchStudent({required this.message});
}
