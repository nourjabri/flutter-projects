part of 'publickhtmaBloc.dart'; 
@immutable

abstract class KhatmaEvent {}

class LoadPublicKhatmas extends KhatmaEvent {}
class AddPublicKhatma extends KhatmaEvent {
  final String niyyah;
  final DateTime startDate;
  final DateTime endDate;
  final int peopleCount;
  final bool isFajria;

  AddPublicKhatma({
    required this.niyyah,
    required this.startDate,
    required this.endDate,
    required this.peopleCount,
    required this.isFajria,
  });
}
