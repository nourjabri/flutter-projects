part of 'students_bloc.dart';

@immutable
sealed class StudentsEvent {}

class CreateStudent extends StudentsEvent {
  final StudentModel student;
  CreateStudent({required this.student}); 

}

class GetAllStudents extends  StudentsEvent{}
