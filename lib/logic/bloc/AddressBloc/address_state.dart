part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoaded extends AddressState {
  final AddressModel addressModel;
  AddressLoaded({required this.addressModel});
  @override
  List<Object> get props => [addressModel];
}

class AddressEmpty extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSaved extends AddressState {}

class AddressSaving extends AddressState {}

class AddressError extends AddressState {
  final String message;
  AddressError({required this.message});
  @override
  List<Object> get props => [message];
}
