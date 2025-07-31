import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serapp/model/publickhtma.dart';
import 'package:serapp/service/publicservice.dart';
part 'Publickhtma_Event.dart';
part 'Publickhtma_State.dart';

class KhatmaBloc extends Bloc<KhatmaEvent, KhatmaState> {
  final PublicKhtmaservice service;

  KhatmaBloc(this.service) : super(KhatmaInitial()) {
    on<AddPublicKhatma>((event, emit) async {
      emit(KhatmaLoading());
      try {
        await service.addPublicKhatma(
          niyyah: event.niyyah,
          startDate: event.startDate,
          endDate: event.endDate,
          peopleCount: event.peopleCount,
          isFajria: event.isFajria,
          peoplename: event.peoplename,
        );

        final khatmas = await service.fetchPublicKhtma();
        emit(KhatmaLoaded(khatmas));
      } catch (e) {
        emit(KhatmaError(e.toString()));
      }
    });

    on<LoadPublicKhatmas>((event, emit) async {
      emit(KhatmaLoading());
      try {
        final khatmas = await service.fetchPublicKhtma();
        emit(KhatmaLoaded(khatmas));
      } catch (e) {
        emit(KhatmaError(e.toString()));
      }
    });
  }
}
