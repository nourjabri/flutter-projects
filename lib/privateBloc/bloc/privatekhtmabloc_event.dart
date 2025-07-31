part of 'privatekhtmabloc_bloc.dart';

@immutable
abstract class PrivatekhtmablocEvent {}

class LoadPrivateKhtma extends PrivatekhtmablocEvent {}

class AddPrivateKhtma extends PrivatekhtmablocEvent {
  final String niyyah;
  final DateTime startdate;
  final DateTime enddate;
  final bool isFajria;
  AddPrivateKhtma({
    required this.enddate,
    required this.isFajria,
    required this.niyyah,
    required this.startdate,
  });
}




