part of 'busmentor_bloc.dart';

@immutable
sealed class BusMentorState {}

final class BusMentorInitial extends BusMentorState {}

class MentorLoading extends BusMentorState {}

class SuccessCreateMentor extends BusMentorState {}

class FailedCreateMentor extends BusMentorState {
  final String message;
  FailedCreateMentor({required this.message});
}

class ErrorMentor extends BusMentorState {
  final String message;
  ErrorMentor({required this.message});
}

class MentorSuccessLoading extends BusMentorState {
  final List<BusMonetorModel> mentors;
  MentorSuccessLoading({required this.mentors});
}

class NoFitchMentors extends BusMentorState {
  final String messages;
  NoFitchMentors({required this.messages});
}
