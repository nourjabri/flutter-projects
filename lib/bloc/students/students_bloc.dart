import 'package:adminapp/model/studentmodel.dart';
import 'package:adminapp/service/student_sercive.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final StundetService stundetService;
  StudentsBloc(this.stundetService) : super(StudentsInitial()) {
    on<CreateStudent>((event, emit) async {
      emit(StudentLoading());
      try {
        await stundetService.createNewStudent(event.student);
        emit(SuccessCreateStudents());
      } catch (e) {
        emit(
          FailedCreateStudent(message: "Failed to create new students account"),
        );
      }
    });
    on<GetAllStudents>((event, emit) async {
      emit(StudentLoading());
      try {
        final students = await stundetService.getAllStudents();
        emit(SuccessLoadStudents(students: students));
      } catch (e) {
        emit(NoFetchStudent(message: "Failed to fetsh Students "));
      }
    });
  }
}
