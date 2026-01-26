import 'package:adminapp/model/TeacherClasses.dart';
import 'package:adminapp/service/class_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'classes_event.dart';
part 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  final TeacherClassService classService;
  ClassesBloc(this.classService) : super(ClassesInitial()) {
    on<CreateClass>((event, emit) async {
      emit(classesLoading());
      try {
        await classService.createTeacherclass(event.classes);
        emit(SuccessCreateClasses());
      } catch (e) {
        emit(FailedCreateClasses(message: "Failed to create new class"));
      }
    });
    on<GetAllTeacherClasses>((event, emit) async {
      emit(classesLoading());
      try {
        final classes = await classService.getAllTeacherClassess();
        emit(ClassesloadedSuccess(classes: classes));
      } catch (e) {
        emit(ErrorClasses(message: "Failed to Fetch teacher classes"));
      }
    });
  }
}
