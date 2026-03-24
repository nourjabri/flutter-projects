part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class LoadedAddresEvent extends AddressEvent {}

class SaveAddressEvevt extends AddressEvent {
  final AddressModel address;
  SaveAddressEvevt({ required this.address}); 
  @override 
  List<Object> get props=>[]; 
}
