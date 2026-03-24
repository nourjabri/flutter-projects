import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clickresturant/data/model/address_model.dart';
import 'package:clickresturant/data/repositories/remote/Adress_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;

  AddressBloc(this.addressRepository) : super(AddressInitial()) {
    on<LoadedAddresEvent>(_load);
    on<SaveAddressEvevt>(_save);
  }

  Future<void> _load(
      LoadedAddresEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString("address");

      if (data == null) {
        emit(AddressEmpty());
        return;
      }

      final jsonMap = jsonDecode(data);
      final address = AddressModel.fromMap(jsonMap);

      emit(AddressLoaded(addressModel: address));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  Future<void> _save(SaveAddressEvevt event, Emitter<AddressState> emit) async {
    emit(AddressSaving());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("address", jsonEncode(event.address.tomap()));

      emit(AddressSaved());

      // تحميل البيانات بعد الحفظ
      add(LoadedAddresEvent());
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }
}
