part of 'privatekhtmabloc_bloc.dart';

@immutable
abstract class PrivatekhtmablocState {}

class PrivatekhtmablocInitial extends PrivatekhtmablocState {}

class PrivteInitial extends PrivatekhtmablocState {}

class PrivateLoading extends PrivatekhtmablocState {}

class PrivateLoaded extends PrivatekhtmablocState {
  final List<PrivateKhtma> privatekhtma;
  PrivateLoaded(this.privatekhtma);
}

class PrivateKhtmaerror extends PrivatekhtmablocState {
  final String message;
  PrivateKhtmaerror(this.message);
}
