import 'package:audioapp/service/authservice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthblocInitial()) {
    on<Tryauth>((event, emit) async {
      emit(LoadingAuth());

      try {
        final response = await authService.checkauth(
          event.email,
          event.password,
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response.accessToken);
        await prefs.setString('refresh_token', response.refreshToken);

        emit(SuccessAuth());
        print("Success login");
      } catch (e) {
        emit(FailedAuth(message: "Login failed. Check credentials."));
      }
    });
  }
}
