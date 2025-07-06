part of 'classes_bloc.dart';

@immutable
sealed class ClassesEvent {}

class CreateClass extends ClassesEvent {
  final TeacherClasses classes;
  CreateClass({required this.classes});

}
class GetAllTeacherClasses extends ClassesEvent{}


