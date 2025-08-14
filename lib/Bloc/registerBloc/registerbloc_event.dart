part of 'registerbloc_bloc.dart';

@immutable
abstract class RegisterEvent {}

class CreateStudentEvent extends RegisterEvent {
  final Studentmodel studentmodel;
  CreateStudentEvent({required this.studentmodel});
}

class FitchAllStudents extends RegisterEvent {}
