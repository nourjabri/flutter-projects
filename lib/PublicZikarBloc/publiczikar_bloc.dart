import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serapp/model/Zikar_model.dart';
import 'package:serapp/service/Zikar_Service.dart';

part 'publiczikar_event.dart';
part 'publiczikar_state.dart';

class PubliczikarBloc extends Bloc<PubliczikarEvent, PubliczikarState> {
  final PubliczikarService zikarService;
  PubliczikarBloc(this.zikarService) : super(PubliczikarInitial()) {
    on<AddPublicZikar>((event, emit) async {
      emit(PubliczikarLoading());
      try {
        await zikarService.addPublicService(
          niyyah: event.niyyah,
          start_date: event.start_date,
          end_date: event.end_date,
          qty_done: event.qty_done,
          qty_suppose: event.qty_suppose,
        );

        final azkar = await zikarService.fetchPublicZikar();
        emit(PubliczikarLoaded(azkar));
      } catch (e) {
        emit(PublicZikarError(e.toString()));
      }
    });

    on<LoadpublicZikar>((event, emit) async {
      emit(PubliczikarLoading());
      try {
        final zikar = await zikarService.fetchPublicZikar();
        emit(PubliczikarLoaded(zikar));
      } catch (e) {
        emit(PublicZikarError(e.toString()));
      }
    });
  }
}
