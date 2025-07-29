
part of 'publickhtmaBloc.dart'; 
@immutable
abstract class KhatmaState {}

class KhatmaInitial extends KhatmaState {}

class KhatmaLoading extends KhatmaState {}

class KhatmaLoaded extends KhatmaState {
  final List<PublicKhtma> khatmas;

  KhatmaLoaded(this.khatmas);
}

class KhatmaError extends KhatmaState {
  final String message;

  KhatmaError(this.message);
}
