import 'package:bloc/bloc.dart';
import 'package:fashionproject/domain/useCase/logoutUseCase.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());
  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await logoutUseCase();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError("Falild to Logout"));
    }
  }
}
