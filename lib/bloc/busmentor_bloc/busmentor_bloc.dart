import 'package:adminapp/model/busmonetormddel.dart';
import 'package:adminapp/service/busmentor_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'busmentor_event.dart';
part 'busmentor_state.dart';

class BusmentorBloc extends Bloc<BusmentorEvent, BusMentorState> {
  final BusMentorService mentorservice;
  BusmentorBloc(this.mentorservice) : super(BusMentorInitial()) {
    on<CreatMentorevent>((event, emit) async {
      emit(MentorLoading());
      try {
        await mentorservice.creatementorservice(event.monetormodel);
        emit(SuccessCreateMentor());
      } catch (e) {
        emit(
          FailedCreateMentor(message: "Failed to create Bus Mentor account"),
        );
      }
    });
    on<GetAllMentorEvent>((event, emit) async {
      emit(MentorLoading());
      try {
        final mentors = await mentorservice.getAllMentors();
        emit(MentorSuccessLoading(mentors: mentors));
      } catch (e) {
        emit(ErrorMentor(message: "Failed to fetch Mentors"));
      }
    });
  }
}
