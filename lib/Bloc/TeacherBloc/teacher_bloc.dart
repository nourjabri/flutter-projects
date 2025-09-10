import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myerp/model/tripmodel.dart';
import 'package:myerp/service/tripservice.dart';

part 'teacher_state.dart';
part 'teacher_event.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripService service;
  TripBloc(this.service) : super(TripInitial()) {
    on<FitchAllTrips>((event, emit) async {
      emit(TripLoading());
      try {
        await service.getAllTrips();
        emit(TripLoadedSuccess(trips: []));
      } catch (e) {
        emit(NoFitchTrips(messages: "no Trips Found"));
      }
    });
  }
}
