part of 'teacher_bloc.dart';

@immutable
sealed class TripEvent {}

class FitchAllTrips extends TripEvent {
  final TripModel tripmodel;
  FitchAllTrips({required this.tripmodel}); 
}
