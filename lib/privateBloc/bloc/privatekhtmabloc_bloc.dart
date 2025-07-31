import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:serapp/service/privateService.dart';

import '../../model/privatekhtma.dart';

part 'privatekhtmabloc_event.dart';
part 'privatekhtmabloc_state.dart';

class PrivatekhtmablocBloc
    extends Bloc<PrivatekhtmablocEvent, PrivatekhtmablocState> {
  final PrivateKhtmaservice privateService;
  PrivatekhtmablocBloc(this.privateService) : super(PrivatekhtmablocInitial()) {
    on<AddPrivateKhtma>((event, emit) async {
      emit(PrivateLoading());
      try {
        await privateService.addPrivateKhatma(
          niyyah: event.niyyah,
          startDate: event.startdate,
          endDate: event.enddate,
          isFajria: event.isFajria,
        );

        final privatekhtmas = await privateService.fetchPrivateKhtma();
        emit(PrivateLoaded(privatekhtmas));
      } catch (e) {
        emit(PrivateKhtmaerror(e.toString()));
      }
    });
    on<LoadPrivateKhtma>((event, emit) async {
      emit(PrivateLoading());
      try {
        final privatekhtams = await privateService.fetchPrivateKhtma();
        emit(PrivateLoaded(privatekhtams));
      } catch (e) {
        emit(PrivateKhtmaerror(e.toString()));
      }
    });
  }
}
