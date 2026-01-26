import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:adminapp/model/parent_model.dart';
import 'package:adminapp/service/parent_service.dart';

part 'parent_event.dart';
part 'parent_state.dart';

class ParentBloc extends Bloc<ParentEvent, ParentState> {
  final ParentService service;

  ParentBloc(this.service) : super(ParentInitial()) {
    on<GetAllParents>((event, emit) async {
      emit(ParentLoading());
      try {
        final parents = await service.GethAllParents();
        emit(ParentLoaded(parents));
      } catch (e) {
        emit(ParentError("Failed to load parents"));
      }
    });



    on<CreateParent>((event, emit) async {
      emit(ParentLoading());
      try {
        await service.CreateNewParent(event.parent);
        emit(ParentCreated());
        add(GetAllParents());
      } catch (e) {
        emit(ParentError("Failed to create Parent"));
      }
    });
  }
}
