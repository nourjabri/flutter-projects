import 'package:bloc/bloc.dart';
import 'package:fashionproject/domain/useCase/registerUserCase.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase userCase;
  RegisterCubit(this.userCase) : super(RegisterInitial());
  Future<void> register({
    required String emial,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await userCase(email: emial, password: password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
