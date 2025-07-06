part of 'classes_bloc.dart';

@immutable
sealed class ClassesState {}

class ClassesInitial extends ClassesState {}

final class classesInitial extends ClassesState {}

 class classesLoading extends ClassesState {}

class SuccessCreateClasses extends ClassesState {}

class FailedCreateClasses extends ClassesState {
  final String message;
  FailedCreateClasses({required this.message});
}

class ErrorClasses extends ClassesState {
  final String message;
  ErrorClasses({required this.message});
}

class ClassesloadedSuccess extends ClassesState {
  final List<TeacherClasses> classes;
  ClassesloadedSuccess({required this.classes});
}

class NoFitchClasses extends ClassesState {
  final String message;
  NoFitchClasses({required this.message}); 
}

