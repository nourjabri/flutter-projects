import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:adminapp/model/TeacherModel.dart';
import 'package:adminapp/service/teacher_service.dart';

part 'teacher_state.dart';
part 'teacher_event.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final TeacherService service;
  TeacherBloc(this.service) : super(TeacherInitial()) {
    on<CreatTeacherevent>((event, emit) async {
      emit(TeacherLoading());
      try {
        await service.createNewTeacher(event.teacherModel);
        emit(SuccessCreateTeacher());
      } catch (e) {
        emit(FailedCreateTeacher(message: "Failed to create new  teacher account"));
      }
    });
    on<GetAllTeacherEvent>((event, emit) async {
      emit(TeacherLoading());
      try {
        final teachers = await service.getAllTeachers();
        emit(TeacherLoadedSuccess(teachers: teachers));
      } catch (e) {
        emit(Error(message: "Failed to fetch teachers"));
      }
    });
  }
}
