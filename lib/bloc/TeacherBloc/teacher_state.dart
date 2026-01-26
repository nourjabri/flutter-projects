part of 'teacher_bloc.dart';

@immutable
sealed class TeacherState {}

final class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class SuccessCreateTeacher extends TeacherState {}

class FailedCreateTeacher extends TeacherState {
  final String message;
  FailedCreateTeacher({required this.message});
}

class Error extends TeacherState {
  final String message;
  Error({required this.message});
}

class TeacherLoadedSuccess extends TeacherState {
  final List<TeacherModel> teachers;
  TeacherLoadedSuccess({required this.teachers});
}

class NoFitchTeachers extends TeacherState {
  final String messages;
  NoFitchTeachers({required this.messages});
}
