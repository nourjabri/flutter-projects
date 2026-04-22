part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressEvent extends AddressEvent {}

class GetCurrentLocation extends AddressEvent {}

class SaveAddressEvent extends AddressEvent {
  final AddressModel address;
  const SaveAddressEvent({required this.address});
  @override
  List<Object> get props => [];
}
