part of 'teacher_bloc.dart';

@immutable
sealed class TeacherEvent {}

class CreatTeacherevent extends TeacherEvent {
  final TeacherModel teacherModel;
  CreatTeacherevent({required this.teacherModel});
}
class GetAllTeacherEvent extends TeacherEvent{}


