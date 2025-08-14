import 'dart:async';

import 'package:audioapp/model/StudentModel.dart';
import 'package:audioapp/service/authservice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registerbloc_event.dart';
part 'registerbloc_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService service;
  RegisterBloc(this.service) : super(StudentInitial()) {
    on<CreateStudentEvent>((event, emit) async {
      emit(StudentLoading());
      try {
        await service.createNewStudent(event.studentmodel);
        emit(SuccessCreateStudent());
      } catch (e) {
        emit(FailedCreateStudnet(message: "Failed to create Student"));
      }
    });
  }
}
