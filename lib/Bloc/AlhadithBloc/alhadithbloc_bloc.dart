import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'alhadithbloc_event.dart';
part 'alhadithbloc_state.dart';

class AlhadithblocBloc extends Bloc<AlhadithblocEvent, AlhadithblocState> {
  AlhadithblocBloc() : super(AlhadithblocInitial());

  @override
  Stream<AlhadithblocState> mapEventToState(
    AlhadithblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
