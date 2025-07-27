import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serapp/model/publickhtma.dart';
import 'package:serapp/service/publicservice.dart';
part 'publickhtmaEvent.dart';
part 'publickhtmaState.dart';

class KhatmaBloc extends Bloc<KhatmaEvent, KhatmaState> {
  final PublicKhtmaservice service;

  KhatmaBloc(this.service) : super(KhatmaInitial()) {
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
