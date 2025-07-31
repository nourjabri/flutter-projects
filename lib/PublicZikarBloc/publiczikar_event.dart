part of 'publiczikar_bloc.dart';

@immutable
abstract class PubliczikarEvent {}

class LoadpublicZikar extends PubliczikarEvent {}

class AddPublicZikar extends PubliczikarEvent {
  final String niyyah;
  final DateTime start_date;
  final DateTime end_date;
  final int qty_done;
  final int qty_suppose;

  AddPublicZikar({
    required this.niyyah,
    required this.start_date,
    required this.end_date,
    required this.qty_done,
    required this.qty_suppose,
  });
}
