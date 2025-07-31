part of 'Publickhtma_Bloc.dart';

@immutable
abstract class KhatmaEvent {}

class LoadPublicKhatmas extends KhatmaEvent {}

class AddPublicKhatma extends KhatmaEvent {
  final String niyyah;
  final DateTime startDate;
  final DateTime endDate;
  final int peopleCount;
  final bool isFajria;
  final String peoplename;

  AddPublicKhatma({
    required this.niyyah,
    required this.startDate,
    required this.endDate,
    required this.peopleCount,
    required this.isFajria,
    required this.peoplename,
  });
}
