/*import 'package:bloc/bloc.dart';
import 'package:zamazam/bloc/login_event.dart';
import 'package:zamazam/bloc/login_state.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginState, LoginEvent> {
  LoginBloc() : super(LoginInitial()) {
    on<Trylogin>((event, emit) async {
      emit(Loading());
      await Future.delayed(Duration(seconds: 2));
      if (event.user.password.length > 8) {
        emit(SucesstoLogin());
      } else {
        emit(FailedtoLogin());
      }
    });
  }
}
*/
