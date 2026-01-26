part of 'busmentor_bloc.dart';

@immutable
sealed class BusmentorEvent {}



class CreatMentorevent extends BusmentorEvent {
  final BusMonetorModel monetormodel;
  CreatMentorevent({required this.monetormodel});
}
class GetAllMentorEvent extends BusmentorEvent{}