part of 'publiczikar_bloc.dart';

@immutable
abstract class PubliczikarState {}

class PubliczikarInitial extends PubliczikarState {}

class PubliczikarLoading extends PubliczikarState {}

class PubliczikarLoaded extends PubliczikarState {
  final List<PublicZikar> azkar;

  PubliczikarLoaded(this.azkar);
}

class PublicZikarError extends PubliczikarState {
  final String message;

  PublicZikarError(this.message);
}
