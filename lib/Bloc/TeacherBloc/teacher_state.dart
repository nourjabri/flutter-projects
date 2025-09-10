part of 'teacher_bloc.dart';

@immutable
sealed class TripState {}

 final class TripInitial extends TripState {}

class TripLoading extends TripState {}

class Error extends TripState {
  final String message;
  Error({required this.message});
}

class TripLoadedSuccess extends TripState {
  final List<TripModel> trips;
  TripLoadedSuccess({required this.trips});
}

class NoFitchTrips extends TripState {
  final String messages;
  NoFitchTrips({required this.messages});
}
